CLASS zcl_shopify_metafield_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS update_metafield
      IMPORTING
        iv_product_id TYPE string          " số thuần, vd '8498507874474'
        iv_value      TYPE string
        iv_namespace  TYPE string DEFAULT 'custom'
        iv_key        TYPE string DEFAULT 'sap_test'
        iv_type       TYPE string DEFAULT 'multi_line_text_field'
      EXPORTING
        ev_status     TYPE i
        ev_message    TYPE string
        ev_response   TYPE string.

  PRIVATE SECTION.

    CONSTANTS:
      gc_url   TYPE string
        VALUE 'https://lgvs-pp4uuuho.myshopify.com/admin/api/2026-07/graphql.json',
      " TODO: đưa token ra Z table config, không để hard-code khi lên PROD
      gc_token TYPE string VALUE 'shpua_6c39a0f1adc23aa1826eed3bd18cf0f4'.

    TYPES:
      BEGIN OF ty_metafield,
        namespace TYPE string,
        key       TYPE string,
        value     TYPE string,
        type      TYPE string,
      END OF ty_metafield,
      tt_metafield TYPE STANDARD TABLE OF ty_metafield WITH DEFAULT KEY,

      BEGIN OF ty_product,
        id         TYPE string,
        metafields TYPE tt_metafield,
      END OF ty_product,

      BEGIN OF ty_variables,
        product TYPE ty_product,
      END OF ty_variables,

      BEGIN OF ty_gql_request,
        query     TYPE string,
        variables TYPE ty_variables,
      END OF ty_gql_request.

    METHODS build_payload
      IMPORTING
        iv_product_id  TYPE string
        iv_namespace   TYPE string
        iv_key         TYPE string
        iv_value       TYPE string
        iv_type        TYPE string
      RETURNING
        VALUE(rv_json) TYPE string.

    METHODS extract_user_errors
      IMPORTING iv_json       TYPE string
      RETURNING VALUE(rv_msg) TYPE string.

ENDCLASS.



CLASS zcl_shopify_metafield_2 IMPLEMENTATION.


  METHOD update_metafield.

    TRY.
        " Tạo destination trực tiếp từ URL - không cần Communication Arrangement
        DATA(lo_destination) = cl_http_destination_provider=>create_by_url( gc_url ).

        DATA(lo_client) = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        DATA(lv_json) = build_payload(
          iv_product_id = iv_product_id
          iv_namespace  = iv_namespace
          iv_key        = iv_key
          iv_value      = iv_value
          iv_type       = iv_type ).

        DATA(lo_req) = lo_client->get_http_request( ).
        lo_req->set_header_field( i_name = 'X-Shopify-Access-Token' i_value = gc_token ).
        lo_req->set_header_field( i_name = 'Content-Type'           i_value = 'application/json' ).
        lo_req->set_header_field( i_name = 'Accept'                 i_value = 'application/json' ).
        lo_req->set_text( lv_json ).

        DATA(lo_resp) = lo_client->execute( if_web_http_client=>post ).

        ev_status   = lo_resp->get_status( )-code.
        ev_response = lo_resp->get_text( ).

        lo_client->close( ).

        IF ev_status >= 400.
          ev_message = |HTTP { ev_status }: { ev_response }|.
          RETURN.
        ENDIF.

        " GraphQL luôn trả 200 kể cả khi lỗi nghiệp vụ -> phải đọc userErrors
        DATA(lv_err) = extract_user_errors( ev_response ).

        IF lv_err IS NOT INITIAL.
          ev_status  = 400.
          ev_message = lv_err.
        ELSE.
          ev_message = |Metafield { iv_namespace }.{ iv_key } updated successfully|.
        ENDIF.

      CATCH cx_web_http_client_error INTO DATA(lx_http).
        ev_status  = 503.
        ev_message = |HTTP error: { lx_http->get_text( ) }|.

      CATCH cx_root INTO DATA(lx_root).
        ev_status  = 500.
        ev_message = |Unexpected error: { lx_root->get_text( ) }|.
    ENDTRY.

  ENDMETHOD.


  METHOD build_payload.

    DATA(lv_query) =
      `mutation UpdateSapText($product: ProductUpdateInput!) { ` &&
      `productUpdate(product: $product) { ` &&
      `userErrors { field message } ` &&
      `product { id title metafield(namespace: "` && iv_namespace && `", key: "` && iv_key && `") ` &&
      `{ id namespace key value type } } } }`.

    DATA(ls_req) = VALUE ty_gql_request(
      query     = lv_query
      variables = VALUE #(
        product = VALUE #(
          id         = |gid://shopify/Product/{ iv_product_id }|
          metafields = VALUE #( ( namespace = iv_namespace
                                  key       = iv_key
                                  value     = iv_value
                                  type      = iv_type ) ) ) ) ).

    rv_json = /ui2/cl_json=>serialize(
                data        = ls_req
                compress    = abap_true
                pretty_name = /ui2/cl_json=>pretty_mode-low_case ).

  ENDMETHOD.


  METHOD extract_user_errors.

    TYPES: BEGIN OF ty_user_error,
             field   TYPE string,
             message TYPE string,
           END OF ty_user_error,
           tt_user_error TYPE STANDARD TABLE OF ty_user_error WITH DEFAULT KEY,

           BEGIN OF ty_product_update,
             user_errors TYPE tt_user_error,
           END OF ty_product_update,

           BEGIN OF ty_data,
             product_update TYPE ty_product_update,
           END OF ty_data,

           BEGIN OF ty_root,
             data TYPE ty_data,
           END OF ty_root.

    DATA ls_root TYPE ty_root.

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING json        = iv_json
                    pretty_name = /ui2/cl_json=>pretty_mode-camel_case
          CHANGING  data        = ls_root ).
      CATCH cx_root.
        RETURN.
    ENDTRY.

    LOOP AT ls_root-data-product_update-user_errors INTO DATA(ls_err).
      IF rv_msg IS INITIAL.
        rv_msg = |{ ls_err-field }: { ls_err-message }|.
      ELSE.
        rv_msg = |{ rv_msg }; { ls_err-field }: { ls_err-message }|.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    update_metafield(
      EXPORTING
        iv_product_id = '8498507874474'
        iv_value      = 'Đã đồng bộ sang SAP 22222 - Material LGV-SKU-001'
      IMPORTING
        ev_status     = DATA(lv_status)
        ev_message    = DATA(lv_message)
        ev_response   = DATA(lv_response) ).

    out->write( |Status : { lv_status }| ).
    out->write( |Message: { lv_message }| ).
    out->write( |--- Raw response ---| ).
    out->write( lv_response ).

  ENDMETHOD.

ENDCLASS.
