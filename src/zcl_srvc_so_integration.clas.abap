CLASS zcl_srvc_so_integration DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_http_service_extension.

  PRIVATE SECTION.
    TYPES: BEGIN OF ts_so_input,
             so_id TYPE string,
           END OF ts_so_input.
    METHODS:
      handle_post
        IMPORTING
          io_request  TYPE REF TO if_web_http_request
          io_response TYPE REF TO if_web_http_response,
      write_log
        IMPORTING
          iv_sap_so_id     TYPE string
          iv_shopify_so_id TYPE string
          iv_status        TYPE i
          iv_message       TYPE string,
      set_response
        IMPORTING
          io_response TYPE REF TO if_web_http_response
          iv_status   TYPE i
          iv_message  TYPE string
          iv_data     TYPE string DEFAULT ''.

ENDCLASS.



CLASS zcl_srvc_so_integration IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    CASE request->get_method( ).
      WHEN 'POST'.
        handle_post( io_request = request io_response = response ).
      WHEN OTHERS.
        set_response(
          io_response = response
          iv_status   = 405
          iv_message  = 'Method Not Allowed'
        ).
    ENDCASE.

  ENDMETHOD.


  METHOD handle_post.
    DATA lv_body TYPE string.
    lv_body = io_request->get_text( ).

    IF lv_body IS INITIAL.
      write_log( iv_sap_so_id     = space
                 iv_shopify_so_id = space
                 iv_status        = 400
                 iv_message       = 'Request body is empty' ).
      set_response( io_response = io_response iv_status = 400 iv_message = 'Request body is empty' ).
      RETURN.
    ENDIF.

    " === STEP 1: Mapping ===
    DATA lo_mapper      TYPE REF TO zcl_mapping_shopify_to_sap.
    DATA ls_so_header    TYPE zcl_push_data=>ty_so_header.
    DATA lt_so_items     TYPE zcl_push_data=>tt_so_items.
    DATA lt_so_partners  TYPE zcl_push_data=>tt_so_partners.
    DATA lt_so_pricing   TYPE zcl_push_data=>tt_so_pricing.
    DATA lt_so_text      TYPE zcl_push_data=>tt_so_note.
    DATA lt_tax_recon    TYPE zcl_mapping_shopify_to_sap=>tt_tax_reconciliation.

    CREATE OBJECT lo_mapper.

    TRY.
        lo_mapper->map_full_order(
          EXPORTING iv_shopify_json = lv_body
          IMPORTING
            es_so_header    = ls_so_header
            et_so_items     = lt_so_items
            et_so_partners  = lt_so_partners
            et_so_pricing   = lt_so_pricing
            et_so_text      = lt_so_text
            et_tax_recon    = lt_tax_recon
        ).
      CATCH cx_root INTO DATA(lx_map).
        DATA(lv_map_err) = |Mapping error: { lx_map->get_text( ) }|.
        write_log( iv_sap_so_id     = space
                   iv_shopify_so_id = space
                   iv_status        = 500
                   iv_message       = lv_map_err ).
        set_response( io_response = io_response iv_status = 500 iv_message = lv_map_err ).
        RETURN.
    ENDTRY.

    DATA(lv_shopify_so_id) = CONV string( ls_so_header-purchase_order_by_customer ).

    " === STEP 2: Push to SAP ===
    DATA lo_push       TYPE REF TO zcl_push_data.
    DATA lv_status     TYPE i.
    DATA lv_msg        TYPE string.
    DATA lv_sap_so_id  TYPE string.

    CREATE OBJECT lo_push.

    lo_push->push_so(
      EXPORTING
        is_so_header   = ls_so_header
        it_so_items    = lt_so_items
        it_so_partners = lt_so_partners
        it_so_pricing  = lt_so_pricing
        it_so_text     = lt_so_text
      IMPORTING
        ev_status      = lv_status
        ev_message     = lv_msg
        ev_sales_order = lv_sap_so_id
    ).

    IF lv_msg IS INITIAL.
      lv_msg = |Sales Order { lv_sap_so_id } created successfully|.
    ENDIF.

    write_log( iv_sap_so_id     = lv_sap_so_id
               iv_shopify_so_id = lv_shopify_so_id
               iv_status        = lv_status
               iv_message       = lv_msg ).

    set_response( io_response = io_response iv_status = lv_status iv_message = lv_msg ).
  ENDMETHOD.


  METHOD set_response.
    DATA lv_json TYPE string.
    DATA lv_status_str TYPE string.

    lv_status_str = iv_status.

    IF iv_data IS NOT INITIAL.
      CONCATENATE `{"status":` lv_status_str `,"message":"` iv_message `","response":` iv_data `}` INTO lv_json.
    ELSE.
      CONCATENATE `{"status":` lv_status_str `,"message":"` iv_message `"}` INTO lv_json.
    ENDIF.

    io_response->set_status( iv_status ).
    io_response->set_header_field(
      i_name  = 'Content-Type'
      i_value = 'application/json'
    ).
    io_response->set_text( lv_json ).
  ENDMETHOD.


  METHOD write_log.
    DATA ls_log TYPE ztb_so_log.

    TRY.
        ls_log-log_uuid = cl_system_uuid=>create_uuid_x16_static( ).
      CATCH cx_uuid_error.
        RETURN.
    ENDTRY.

    ls_log-shopify_so_id = iv_shopify_so_id.
    ls_log-sap_so_id     = iv_sap_so_id.
    ls_log-status        = iv_status.
    ls_log-message       = iv_message.

    GET TIME STAMP FIELD DATA(lv_tsl).
    ls_log-created_at      = lv_tsl.
    ls_log-created_by      = sy-uname.
    ls_log-created_on      = cl_abap_context_info=>get_system_date( ).
    ls_log-last_changed_at = lv_tsl.
    ls_log-last_changed_by = sy-uname.
    ls_log-last_changed_on = ls_log-created_on.

    TRY.
        ls_log-created_by_desc = cl_abap_context_info=>get_user_formatted_name( ).
      CATCH cx_abap_context_info_error.
        ls_log-created_by_desc = sy-uname.
    ENDTRY.

    INSERT ztb_so_log FROM @ls_log.

    IF sy-subrc = 0.
      COMMIT WORK.
    ELSE.
      ROLLBACK WORK.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
