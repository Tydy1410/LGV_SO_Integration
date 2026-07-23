CLASS zcl_push_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      ty_so_header   TYPE zscm_so_integration=>tys_sales_order_type,
      ty_so_item     TYPE zscm_so_integration=>tys_sales_order_item_type,
      ty_so_partner  TYPE zscm_so_integration=>tys_sales_order_partner_type,
      ty_so_pricing  TYPE zscm_so_integration=>tys_sales_order_item_pricing_2,
      ty_so_note     TYPE zscm_so_integration=>tys_sales_order_text_type,

      tt_so_items    TYPE STANDARD TABLE OF ty_so_item    WITH DEFAULT KEY,
      tt_so_partners TYPE STANDARD TABLE OF ty_so_partner WITH DEFAULT KEY,
      tt_so_pricing  TYPE STANDARD TABLE OF ty_so_pricing WITH DEFAULT KEY,
      tt_so_note     TYPE STANDARD TABLE OF ty_so_note    WITH DEFAULT KEY.

    METHODS:
      push_so
        IMPORTING
          is_so_header   TYPE ty_so_header
          it_so_items    TYPE tt_so_items
          it_so_partners TYPE tt_so_partners
          it_so_pricing  TYPE tt_so_pricing
          it_so_text     TYPE tt_so_note
        EXPORTING
          ev_status      TYPE i
          ev_message     TYPE string
          ev_sales_order TYPE string,

      extract_sales_order
        IMPORTING iv_json      TYPE string
        RETURNING VALUE(rv_so) TYPE string,

      extract_error_message
        IMPORTING iv_json       TYPE string
        RETURNING VALUE(rv_msg) TYPE string.

  PRIVATE SECTION.

    CONSTANTS:
      gc_comm_scenario TYPE c LENGTH 30 VALUE 'YY1_SRVC_CS',
      gc_service_root  TYPE string
        VALUE '/sap/opu/odata4/sap/api_salesorder/srvd_a2x/sap/salesorder/0001'.

    TYPES:
      BEGIN OF ty_deep_pricing,
        condition_type        TYPE string,
        condition_rate_amount TYPE decfloat34,
        condition_currency    TYPE string,
      END OF ty_deep_pricing,
      tt_deep_pricing TYPE STANDARD TABLE OF ty_deep_pricing WITH DEFAULT KEY,

      BEGIN OF ty_unit_cache,
        sap_unit TYPE string,
        iso_unit TYPE string,
      END OF ty_unit_cache,
      tt_unit_cache TYPE HASHED TABLE OF ty_unit_cache WITH UNIQUE KEY sap_unit,

      BEGIN OF ty_deep_item,
        sales_order_item           TYPE string,
        product                    TYPE string,
        sales_order_item_text      TYPE string,
        requested_quantity         TYPE decfloat34,
        requested_quantity_sapunit TYPE string,
        requested_quantity_isounit TYPE string,
        plant                      TYPE string,
        link_item_pricing_element  TYPE tt_deep_pricing,
      END OF ty_deep_item,
      tt_deep_items TYPE STANDARD TABLE OF ty_deep_item WITH DEFAULT KEY,

      BEGIN OF ty_deep_partner,
        partner_function        TYPE string,
        customer                TYPE string,
        business_partner_name_1 TYPE string,
        business_partner_name_2 TYPE string,
        business_partner_name_3 TYPE string,
        street_name             TYPE string,
        street_suffix_name_1    TYPE string,
        street_suffix_name_2    TYPE string,
        district_name           TYPE string,
        city_name               TYPE string,
        postal_code             TYPE string,
        country                 TYPE string,
        correspondence_language TYPE string,
        email_address           TYPE string,
        phone_number            TYPE string,
        mobile_phone_number     TYPE string,
      END OF ty_deep_partner,
      tt_deep_partners TYPE STANDARD TABLE OF ty_deep_partner WITH DEFAULT KEY,

      BEGIN OF ty_deep_text,
        language     TYPE string,
        long_text_id TYPE string,
        long_text    TYPE string,
      END OF ty_deep_text,
      tt_deep_text TYPE STANDARD TABLE OF ty_deep_text WITH DEFAULT KEY,

      BEGIN OF ty_deep_so,
        sales_order_type           TYPE string,
        sold_to_party              TYPE string,
        sales_organization         TYPE string,
        distribution_channel       TYPE string,
        organization_division      TYPE string,
        transaction_currency       TYPE string,
        purchase_order_by_customer TYPE string,
        requested_delivery_date    TYPE string,
        customer_payment_terms     TYPE string,
        shipping_condition         TYPE string,
        sd_document_reason         TYPE string,
        link_partner               TYPE tt_deep_partners,
        link_item                  TYPE tt_deep_items,
        link_pricing_element       TYPE tt_deep_pricing,
        link_text                  TYPE tt_deep_text,
      END OF ty_deep_so.

    DATA mt_unit_cache TYPE tt_unit_cache.

    METHODS:
      get_csrf_token
        IMPORTING
          io_client       TYPE REF TO if_web_http_client
        RETURNING
          VALUE(rv_token) TYPE string,

      get_iso_unit
        IMPORTING
          iv_sap_unit   TYPE string
        RETURNING
          VALUE(rv_iso) TYPE string,

      build_deep_payload
        IMPORTING
          is_so_header   TYPE ty_so_header
          it_so_items    TYPE tt_so_items
          it_so_partners TYPE tt_so_partners
          it_so_pricing  TYPE tt_so_pricing
          it_so_text     TYPE tt_so_note
        RETURNING
          VALUE(rv_json) TYPE string,

      write_log
        IMPORTING
          is_so_header TYPE ty_so_header
          iv_sap_so_id TYPE string
          iv_status    TYPE i
          iv_message   TYPE string.

ENDCLASS.



CLASS zcl_push_data IMPLEMENTATION.


  METHOD push_so.
    DATA lo_http_client TYPE REF TO if_web_http_client.

    TRY.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
                                 comm_scenario = gc_comm_scenario ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        DATA(lv_token) = get_csrf_token( lo_http_client ).

        DATA(lv_json) = build_deep_payload(
          is_so_header   = is_so_header
          it_so_items    = it_so_items
          it_so_partners = it_so_partners
          it_so_pricing  = it_so_pricing
          it_so_text     = it_so_text
        ).

        DATA(lo_req) = lo_http_client->get_http_request( ).
        lo_req->set_uri_path( |{ gc_service_root }/SalesOrder| ).
        lo_req->set_header_field( i_name = 'x-csrf-token'  i_value = lv_token ).
        lo_req->set_header_field( i_name = 'content-type'  i_value = 'application/json;charset=utf-8' ).
        lo_req->set_header_field( i_name = 'accept'        i_value = 'application/json' ).
        lo_req->set_text( lv_json ).

        DATA(lo_resp) = lo_http_client->execute( if_web_http_client=>post ).

        IF lo_resp->get_status( )-code >= 400.
          ev_status  = lo_resp->get_status( )-code.
          ev_message = extract_error_message( lo_resp->get_text( ) ).
          lo_http_client->close( ).
        ELSE.
          ev_status      = lo_resp->get_status( )-code.
          ev_sales_order = extract_sales_order( lo_resp->get_text( ) ).
          ev_message     = |Sales Order { ev_sales_order } created successfully|.
          lo_http_client->close( ).
        ENDIF.

      CATCH cx_web_http_client_error INTO DATA(lx_http).
        ev_status  = 503.
        ev_message = |HTTP error: { lx_http->get_text( ) }|.

      CATCH cx_root INTO DATA(lx_root).
        ev_status  = 500.
        ev_message = |Unexpected error: { lx_root->get_text( ) }|.
    ENDTRY.

    write_log(
      is_so_header = is_so_header
      iv_sap_so_id = ev_sales_order
      iv_status    = ev_status
      iv_message   = ev_message ).

  ENDMETHOD.


  METHOD write_log.

    DATA ls_log TYPE ztb_so_log.

    TRY.
        ls_log-log_uuid = cl_system_uuid=>create_uuid_x16_static( ).
      CATCH cx_uuid_error.
        RETURN.
    ENDTRY.

    ls_log-shopify_so_id = is_so_header-purchase_order_by_customer.
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


  METHOD get_csrf_token.

    TRY.
        DATA(lo_req) = io_client->get_http_request( ).
        lo_req->set_uri_path( |{ gc_service_root }/| ).
        lo_req->set_header_field( i_name = 'x-csrf-token' i_value = 'Fetch' ).

        DATA(lo_resp) = io_client->execute( if_web_http_client=>get ).

        DATA(ls_status) = lo_resp->get_status( ).
        DATA(lv_body)   = lo_resp->get_text( ).

        IF ls_status-code <> 200.
          CLEAR rv_token.
          RETURN.
        ENDIF.

        rv_token = lo_resp->get_header_field( 'x-csrf-token' ).

      CATCH cx_web_http_client_error INTO DATA(lx_http).
        DATA(lv_http_err) = lx_http->get_text( ).
        CLEAR rv_token.

      CATCH cx_root INTO DATA(lx_root).
        DATA(lv_root_err) = lx_root->get_text( ).
        CLEAR rv_token.

    ENDTRY.

  ENDMETHOD.


  METHOD build_deep_payload.
    DATA ls_deep_so TYPE ty_deep_so.

    ls_deep_so-sales_order_type            = is_so_header-sales_order_type_2.
    ls_deep_so-sold_to_party                = is_so_header-sold_to_party.
    ls_deep_so-sales_organization            = is_so_header-sales_organization.
    ls_deep_so-distribution_channel          = is_so_header-distribution_channel.
    ls_deep_so-organization_division         = is_so_header-organization_division.
    ls_deep_so-transaction_currency          = is_so_header-transaction_currency.
    ls_deep_so-purchase_order_by_customer    = is_so_header-purchase_order_by_customer.
    ls_deep_so-requested_delivery_date       = |{ is_so_header-requested_delivery_date DATE = ISO }|.
    ls_deep_so-customer_payment_terms        = is_so_header-customer_payment_terms.
    ls_deep_so-shipping_condition             = is_so_header-shipping_condition.
    ls_deep_so-sd_document_reason             = is_so_header-sddocument_reason.

    LOOP AT it_so_partners INTO DATA(ls_src_partner).
      APPEND VALUE #(
        partner_function          = ls_src_partner-partner_function
        customer                   = ls_src_partner-customer
        business_partner_name_1   = ls_src_partner-business_partner_name_1
        business_partner_name_2   = ls_src_partner-business_partner_name_2
        business_partner_name_3   = ls_src_partner-business_partner_name_3
        street_name                 = ls_src_partner-street_name
        street_suffix_name_1        = ls_src_partner-street_suffix_name_1
        street_suffix_name_2        = ls_src_partner-street_suffix_name_2
        district_name                = ls_src_partner-district_name
        city_name                    = ls_src_partner-city_name
        postal_code                   = ls_src_partner-postal_code
        country                       = ls_src_partner-country
        correspondence_language      = ls_src_partner-correspondence_language
        email_address                  = ls_src_partner-email_address
        phone_number                   = ls_src_partner-phone_number
        mobile_phone_number            = ls_src_partner-mobile_phone_number
      ) TO ls_deep_so-link_partner.
    ENDLOOP.

    LOOP AT it_so_items INTO DATA(ls_src_item).
      DATA ls_deep_item TYPE ty_deep_item.
      CLEAR ls_deep_item.

      ls_deep_item-sales_order_item           = ls_src_item-sales_order_item.
      ls_deep_item-product                    = ls_src_item-product.
      ls_deep_item-sales_order_item_text      = ls_src_item-sales_order_item_text.
      ls_deep_item-requested_quantity         = ls_src_item-requested_quantity.
      ls_deep_item-requested_quantity_sapunit = ls_src_item-requested_quantity_sapunit.
      ls_deep_item-requested_quantity_isounit = get_iso_unit( CONV string( ls_src_item-requested_quantity_sapunit ) ).
      ls_deep_item-plant                      = ls_src_item-plant.

      LOOP AT it_so_pricing INTO DATA(ls_src_price)
        WHERE sales_order_item = ls_src_item-sales_order_item.

        APPEND VALUE #(
          condition_type        = ls_src_price-condition_type
          condition_rate_amount = ls_src_price-condition_rate_amount
          condition_currency    = ls_src_price-condition_currency
        ) TO ls_deep_item-link_item_pricing_element.
      ENDLOOP.

      APPEND ls_deep_item TO ls_deep_so-link_item.
    ENDLOOP.

    LOOP AT it_so_pricing INTO DATA(ls_header_price) WHERE sales_order_item IS INITIAL.
      APPEND VALUE #(
        condition_type        = ls_header_price-condition_type
        condition_rate_amount = ls_header_price-condition_rate_amount
        condition_currency    = ls_header_price-condition_currency
      ) TO ls_deep_so-link_pricing_element.
    ENDLOOP.

    LOOP AT it_so_text INTO DATA(ls_src_text).
      APPEND VALUE #(
        language     = ls_src_text-language
        long_text_id = ls_src_text-long_text_id
        long_text    = ls_src_text-long_text
      ) TO ls_deep_so-link_text.
    ENDLOOP.

    /ui2/cl_json=>serialize(
      EXPORTING
        data           = ls_deep_so
        pretty_name    = /ui2/cl_json=>pretty_mode-pascal_case
        compress       = 'X'
        numc_as_string = 'X'
      RECEIVING
        r_json         = rv_json
    ).

    REPLACE ALL OCCURRENCES OF 'LinkPartner'             IN rv_json WITH '_Partner'.
    REPLACE ALL OCCURRENCES OF 'LinkItem'                 IN rv_json WITH '_Item'.
    REPLACE ALL OCCURRENCES OF 'LinkItemPricingElement'   IN rv_json WITH '_ItemPricingElement'.
    REPLACE ALL OCCURRENCES OF 'LinkPricingElement'       IN rv_json WITH '_PricingElement'.
    REPLACE ALL OCCURRENCES OF 'LinkText'                 IN rv_json WITH '_Text'.

    REPLACE ALL OCCURRENCES OF 'RequestedQuantitySapunit' IN rv_json WITH 'RequestedQuantitySAPUnit'.
    REPLACE ALL OCCURRENCES OF 'RequestedQuantityIsounit' IN rv_json WITH 'RequestedQuantityISOUnit'.
    REPLACE ALL OCCURRENCES OF 'SdDocumentReason'         IN rv_json WITH 'SDDocumentReason'.
    REPLACE ALL OCCURRENCES OF 'LongTextId'               IN rv_json WITH 'LongTextID'.
  ENDMETHOD.


  METHOD extract_error_message.

    TYPES: BEGIN OF ty_detail,
             message TYPE string,
           END OF ty_detail,
           tt_detail TYPE STANDARD TABLE OF ty_detail WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_error,
             code    TYPE string,
             message TYPE string,
             details TYPE tt_detail,
           END OF ty_error.

    TYPES: BEGIN OF ty_root,
             error TYPE ty_error,
           END OF ty_root.

    DATA ls_root TYPE ty_root.

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING json        = iv_json
                    pretty_name = /ui2/cl_json=>pretty_mode-camel_case
          CHANGING  data        = ls_root ).
      CATCH cx_root.
        rv_msg = COND #( WHEN strlen( iv_json ) > 200
                         THEN |{ iv_json(200) }...|
                         ELSE iv_json ).
        RETURN.
    ENDTRY.

    rv_msg = ls_root-error-message.
    LOOP AT ls_root-error-details INTO DATA(ls_detail).
      IF ls_detail-message IS INITIAL
      OR ls_detail-message CS 'Parser error'
      OR ls_detail-message CS 'Data Services Request'.
        CONTINUE.
      ENDIF.
      rv_msg = |{ rv_msg }; { ls_detail-message }|.
    ENDLOOP.

    IF rv_msg IS INITIAL.
      rv_msg = 'Unknown error from SAP API'.
    ENDIF.

  ENDMETHOD.


  METHOD get_iso_unit.

    IF iv_sap_unit IS INITIAL.
      RETURN.
    ENDIF.

    READ TABLE mt_unit_cache
      WITH TABLE KEY sap_unit = iv_sap_unit
      INTO DATA(ls_cache).

    IF sy-subrc = 0.
      rv_iso = ls_cache-iso_unit.
      RETURN.
    ENDIF.

    SELECT SINGLE UnitOfMeasureISOCode
      FROM I_UnitOfMeasure
      WHERE UnitOfMeasure = @iv_sap_unit
      INTO @rv_iso.

    IF sy-subrc <> 0.
      CLEAR rv_iso.
    ENDIF.

    INSERT VALUE #( sap_unit = iv_sap_unit
                    iso_unit = rv_iso ) INTO TABLE mt_unit_cache.

  ENDMETHOD.


  METHOD extract_sales_order.

    TYPES: BEGIN OF ty_resp,
             sales_order TYPE string,
           END OF ty_resp.

    DATA ls_resp TYPE ty_resp.

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING json        = iv_json
                    pretty_name = /ui2/cl_json=>pretty_mode-pascal_case
          CHANGING  data        = ls_resp ).
      CATCH cx_root.
        CLEAR rv_so.
        RETURN.
    ENDTRY.

    rv_so = ls_resp-sales_order.

  ENDMETHOD.

ENDCLASS.
