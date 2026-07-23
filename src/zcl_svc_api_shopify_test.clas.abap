CLASS zcl_svc_api_shopify_test DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_http_service_extension .

  PROTECTED SECTION.
  PRIVATE SECTION.

    TYPES:
      tt_string TYPE STANDARD TABLE OF string WITH DEFAULT KEY,

      BEGIN OF ts_variant,
        id                 TYPE string,
        title              TYPE string,
        sku                TYPE string,
        barcode            TYPE string,
        price              TYPE string,
        compare_at_price   TYPE string,
        position           TYPE i,
        inventory_quantity TYPE i,
        available_for_sale TYPE abap_bool,
        taxable            TYPE abap_bool,
        option_values      TYPE string,
      END OF ts_variant,
      tt_variant TYPE STANDARD TABLE OF ts_variant WITH DEFAULT KEY,

      BEGIN OF ts_collection,
        id     TYPE string,
        title  TYPE string,
        handle TYPE string,
      END OF ts_collection,
      tt_collection TYPE STANDARD TABLE OF ts_collection WITH DEFAULT KEY,

      BEGIN OF ts_metafield,
        namespace TYPE string,
        key       TYPE string,
        value     TYPE string,
        type      TYPE string,
      END OF ts_metafield,
      tt_metafield TYPE STANDARD TABLE OF ts_metafield WITH DEFAULT KEY,

      " === Payload nhận vào ===
      BEGIN OF ts_input,
        event_type      TYPE string,
        " Product fields
        product_id      TYPE string,
        title           TYPE string,
        handle          TYPE string,
        description     TYPE string,
        product_type    TYPE string,
        vendor          TYPE string,
        status          TYPE string,
        created_at      TYPE string,
        updated_at      TYPE string,
        total_inventory TYPE i,
        image_url       TYPE string,
        sku             TYPE string,
        price           TYPE string,
        barcode         TYPE string,
        variant_count   TYPE i,
        tags            TYPE tt_string,
        variants        TYPE tt_variant,
        collections     TYPE tt_collection,
        metafields      TYPE tt_metafield,
        " Order fields
        order_id        TYPE string,
        order_number    TYPE string,
      END OF ts_input.

    " === Response cho luồng product ===
    TYPES:
      BEGIN OF ts_product_resp,
        status          TYPE i,
        message         TYPE string,
        type            TYPE string,
        product_id      TYPE string,
        title           TYPE string,
        handle          TYPE string,
        description     TYPE string,
        product_type    TYPE string,
        vendor          TYPE string,
        product_status  TYPE string,
        created_at      TYPE string,
        updated_at      TYPE string,
        total_inventory TYPE i,
        image_url       TYPE string,
        sku             TYPE string,
        price           TYPE string,
        barcode         TYPE string,
        variant_count   TYPE i,
        tags            TYPE tt_string,
        variants        TYPE tt_variant,
        collections     TYPE tt_collection,
        metafields      TYPE tt_metafield,
      END OF ts_product_resp.

    METHODS set_response
      IMPORTING
        io_response TYPE REF TO if_web_http_response
        iv_status   TYPE i
        iv_message  TYPE string
        iv_id       TYPE string DEFAULT ''
        iv_type     TYPE string DEFAULT ''.

    METHODS set_response_payload
      IMPORTING
        io_response TYPE REF TO if_web_http_response
        iv_status   TYPE i
        is_data     TYPE ts_product_resp.

    " Tìm metafield theo namespace + key
    METHODS get_metafield
      IMPORTING
        it_metafields   TYPE tt_metafield
        iv_namespace    TYPE string DEFAULT 'custom'
        iv_key          TYPE string
      RETURNING
        VALUE(rv_value) TYPE string.

ENDCLASS.



CLASS zcl_svc_api_shopify_test IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    IF request->get_method( ) <> 'POST'.
      set_response( io_response = response
                    iv_status   = 405
                    iv_message  = 'Method Not Allowed' ).
      RETURN.
    ENDIF.

    DATA(lv_body) = request->get_text( ).

    IF lv_body IS INITIAL.
      set_response( io_response = response
                    iv_status   = 400
                    iv_message  = 'Request body is empty' ).
      RETURN.
    ENDIF.

    DATA ls_input TYPE ts_input.

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING json = lv_body
          CHANGING  data = ls_input ).
      CATCH cx_root INTO DATA(lx_json).
        set_response( io_response = response
                      iv_status   = 400
                      iv_message  = |Invalid JSON: { lx_json->get_text( ) }| ).
        RETURN.
    ENDTRY.

    CASE ls_input-event_type.

      WHEN 'product'.

        IF ls_input-product_id IS INITIAL.
          set_response( io_response = response
                        iv_status   = 400
                        iv_message  = 'product_id is missing' ).
          RETURN.
        ENDIF.


        set_response_payload(
          io_response = response
          iv_status   = 200
          is_data     = VALUE #(
            status          = 200
            message         = 'Product received'
            type            = 'product'
            product_id      = ls_input-product_id
            title           = ls_input-title
            handle          = ls_input-handle
            description     = ls_input-description
            product_type    = ls_input-product_type
            vendor          = ls_input-vendor
            product_status  = ls_input-status
            created_at      = ls_input-created_at
            updated_at      = ls_input-updated_at
            total_inventory = ls_input-total_inventory
            image_url       = ls_input-image_url
            sku             = ls_input-sku
            price           = ls_input-price
            barcode         = ls_input-barcode
            variant_count   = ls_input-variant_count
            tags            = ls_input-tags
            variants        = ls_input-variants
            collections     = ls_input-collections
            metafields      = ls_input-metafields ) ).

      WHEN 'order'.

        IF ls_input-order_id IS INITIAL.
          set_response( io_response = response
                        iv_status   = 400
                        iv_message  = 'order_id is missing' ).
          RETURN.
        ENDIF.

        " TODO: gọi zcl_mapping_shopify_to_sap + zcl_push_data ở đây

        set_response( io_response = response
                      iv_status   = 200
                      iv_message  = 'Order received'
                      iv_id       = ls_input-order_id
                      iv_type     = 'order' ).

      WHEN OTHERS.
        set_response( io_response = response
                      iv_status   = 400
                      iv_message  = |Unknown event_type: { ls_input-event_type }| ).

    ENDCASE.

  ENDMETHOD.


  METHOD get_metafield.

    READ TABLE it_metafields
      WITH KEY namespace = iv_namespace
               key       = iv_key
      INTO DATA(ls_mf).

    IF sy-subrc = 0.
      rv_value = ls_mf-value.
    ENDIF.

  ENDMETHOD.


  METHOD set_response_payload.

    DATA(lv_json) = /ui2/cl_json=>serialize(
                      data        = is_data
                      compress    = abap_false
                      pretty_name = /ui2/cl_json=>pretty_mode-low_case ).

    io_response->set_status( iv_status ).
    io_response->set_header_field( i_name  = 'Content-Type'
                                   i_value = 'application/json' ).
    io_response->set_text( lv_json ).

  ENDMETHOD.


  METHOD set_response.
    DATA lv_json TYPE string.

    IF iv_id IS NOT INITIAL.
      lv_json = |\{"status":{ iv_status },"message":"{ iv_message }","type":"{ iv_type }","id":"{ iv_id }"\}|.
    ELSE.
      lv_json = |\{"status":{ iv_status },"message":"{ iv_message }"\}|.
    ENDIF.

    io_response->set_status( iv_status ).
    io_response->set_header_field( i_name  = 'Content-Type'
                                   i_value = 'application/json' ).
    io_response->set_text( lv_json ).
  ENDMETHOD.

ENDCLASS.
