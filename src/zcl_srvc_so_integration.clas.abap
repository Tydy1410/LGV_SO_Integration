CLASS zcl_srvc_so_integration DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_http_service_extension.

  PRIVATE SECTION.
    METHODS:
      handle_post
        IMPORTING
          io_request  TYPE REF TO if_web_http_request
          io_response TYPE REF TO if_web_http_response,

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

    DATA(lv_body) = io_request->get_text( ).

    DATA(lo_mapper) = NEW zcl_mapping_shopify_to_sap( ).

    lo_mapper->map_full_order(
      EXPORTING iv_shopify_json = lv_body
      IMPORTING
        es_so_header    = DATA(ls_so_header)
        et_so_items     = DATA(lt_so_items)
        et_so_partners  = DATA(lt_so_partners)
        et_so_pricing   = DATA(lt_so_pricing)
        et_so_text      = DATA(lt_so_text)
        et_tax_recon    = DATA(lt_tax_recon)
        ev_status       = DATA(lv_map_status)
        ev_message      = DATA(lv_map_msg)
    ).

    IF lv_map_status IS NOT INITIAL.
      set_response( io_response = io_response
                    iv_status   = lv_map_status
                    iv_message  = lv_map_msg ).
      RETURN.
    ENDIF.

    DATA(lo_push) = NEW zcl_push_data( ).

    lo_push->push_so(
      EXPORTING
        is_so_header   = ls_so_header
        it_so_items    = lt_so_items
        it_so_partners = lt_so_partners
        it_so_pricing  = lt_so_pricing
        it_so_text     = lt_so_text
      IMPORTING
        ev_status      = DATA(lv_status)
        ev_message     = DATA(lv_msg)
        ev_sales_order = DATA(lv_sap_so_id)
    ).

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

ENDCLASS.
