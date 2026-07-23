CLASS zcl_mapping_shopify_to_sap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ts_shopify_tax_line,
        price TYPE string,
        rate  TYPE string,
        title TYPE string,
      END OF ts_shopify_tax_line,
      tt_shopify_tax_lines TYPE STANDARD TABLE OF ts_shopify_tax_line WITH DEFAULT KEY,

      BEGIN OF ts_shopify_line_item,
        id        TYPE string,
        sku       TYPE string,
        title     TYPE string,
        quantity  TYPE i,
        price     TYPE string,
        tax_lines TYPE tt_shopify_tax_lines,
      END OF ts_shopify_line_item,
      tt_shopify_line_items TYPE STANDARD TABLE OF ts_shopify_line_item WITH DEFAULT KEY,

      BEGIN OF ts_shopify_shipping_line,
        price TYPE string,
      END OF ts_shopify_shipping_line,
      tt_shopify_shipping_lines TYPE STANDARD TABLE OF ts_shopify_shipping_line WITH DEFAULT KEY,

      BEGIN OF ts_shopify_address,
        first_name    TYPE string,
        last_name     TYPE string,
        name          TYPE string,
        address1      TYPE string,
        address2      TYPE string,
        city          TYPE string,
        zip           TYPE string,
        province      TYPE string,
        province_code TYPE string,
        country_code  TYPE string,
        phone         TYPE string,
      END OF ts_shopify_address,

      BEGIN OF ts_shopify_customer,
        id TYPE string,
      END OF ts_shopify_customer,

      BEGIN OF ts_shopify_payment_terms,
        payment_terms_name TYPE string,
      END OF ts_shopify_payment_terms,

      BEGIN OF ts_shopify_order,
        id                   TYPE string,
        order_number         TYPE i,
        created_at           TYPE string,
        currency             TYPE string,
        presentment_currency TYPE string,
        customer_locale      TYPE string,
        email                TYPE string,
        note                 TYPE string,
        location_id          TYPE string,
        payment_terms        TYPE ts_shopify_payment_terms,
        customer             TYPE ts_shopify_customer,
        shipping_address     TYPE ts_shopify_address,
        billing_address      TYPE ts_shopify_address,
        shipping_lines       TYPE tt_shopify_shipping_lines,
        line_items           TYPE tt_shopify_line_items,
      END OF ts_shopify_order.

    TYPES:
      BEGIN OF ts_tax_reconciliation,
        sales_order_item   TYPE string,
        shopify_tax_amount TYPE string,
        shopify_tax_title  TYPE string,
      END OF ts_tax_reconciliation,
      tt_tax_reconciliation TYPE STANDARD TABLE OF ts_tax_reconciliation WITH DEFAULT KEY.

    TYPES:
      tt_sap_items    TYPE STANDARD TABLE OF zscm_so_integration=>tys_sales_order_item_type    WITH DEFAULT KEY,
      tt_sap_partners TYPE STANDARD TABLE OF zscm_so_integration=>tys_sales_order_partner_type  WITH DEFAULT KEY,
      tt_sap_pricing  TYPE STANDARD TABLE OF zscm_so_integration=>tys_sales_order_item_pricing_2 WITH DEFAULT KEY,
      tt_sap_text     TYPE STANDARD TABLE OF zscm_so_integration=>tys_sales_order_text_type      WITH DEFAULT KEY.

    METHODS:
      map_so_header
        IMPORTING
          is_shopify_order TYPE ts_shopify_order
        RETURNING
          VALUE(rs_sap_so) TYPE zscm_so_integration=>tys_sales_order_type,

      map_so_items
        IMPORTING
          is_shopify_order    TYPE ts_shopify_order
        RETURNING
          VALUE(rt_sap_items) TYPE tt_sap_items,

      map_so_partners
        IMPORTING
          is_shopify_order       TYPE ts_shopify_order
        RETURNING
          VALUE(rt_sap_partners) TYPE tt_sap_partners,

      map_so_pricing
        IMPORTING
          is_shopify_order      TYPE ts_shopify_order
        RETURNING
          VALUE(rt_sap_pricing) TYPE tt_sap_pricing,

      map_so_text
        IMPORTING
          is_shopify_order   TYPE ts_shopify_order
        RETURNING
          VALUE(rt_sap_text) TYPE tt_sap_text,

      get_tax_reconciliation
        IMPORTING
          is_shopify_order TYPE ts_shopify_order
        RETURNING
          VALUE(rt_recon)  TYPE tt_tax_reconciliation,

      map_full_order
        IMPORTING
          iv_shopify_json TYPE string
        EXPORTING
          es_so_header    TYPE zscm_so_integration=>tys_sales_order_type
          et_so_items     TYPE tt_sap_items
          et_so_partners  TYPE tt_sap_partners
          et_so_pricing   TYPE tt_sap_pricing
          et_so_text      TYPE tt_sap_text
          et_tax_recon    TYPE tt_tax_reconciliation
          ev_status       TYPE i
          ev_message      TYPE string.

  PRIVATE SECTION.

    CONSTANTS:
      gc_one_time_customer  TYPE string VALUE '0000100000',
      gc_sd_document_reason TYPE string VALUE '',
      gc_shpcond_with_fee   TYPE string VALUE '01',
      gc_shpcond_no_fee     TYPE string VALUE '02',
      gc_condition_pr00     TYPE string VALUE 'PR00',
      gc_condition_ybhd     TYPE string VALUE 'YBHD',
      gc_uom_ea             TYPE string VALUE 'EA',
      " TODO: xác nhận Language key thật SAP dùng cho note (FS chưa chốt)
      gc_note_language      TYPE string VALUE '쁩'.

    METHODS:
      split_street
        IMPORTING
          iv_address1 TYPE string
          iv_address2 TYPE string
        EXPORTING
          ev_street   TYPE string
          ev_suffix1  TYPE string,

      convert_date
        IMPORTING
          iv_shopify_date    TYPE string
        RETURNING
          VALUE(rv_sap_date) TYPE d,

      build_address_partner
        IMPORTING
          iv_partner_function TYPE string
          is_address          TYPE ts_shopify_address
          iv_email            TYPE string
          iv_locale           TYPE string
          iv_customer_bp      TYPE string OPTIONAL
        RETURNING
          VALUE(rs_partner)   TYPE zscm_so_integration=>tys_sales_order_partner_type,

      determine_sold_to_party
        IMPORTING
          is_shopify_order TYPE ts_shopify_order
        RETURNING
          VALUE(rv_bp)     TYPE string,

      write_log
        IMPORTING
          iv_shopify_so_id TYPE string
          iv_status        TYPE i
          iv_message       TYPE string.

ENDCLASS.


CLASS zcl_mapping_shopify_to_sap IMPLEMENTATION.


  METHOD map_full_order.

    CLEAR: ev_status, ev_message.

    IF iv_shopify_json IS INITIAL.
      ev_status  = 400.
      ev_message = 'Request body is empty'.
      write_log( iv_shopify_so_id = space
                 iv_status        = ev_status
                 iv_message       = ev_message ).
      RETURN.
    ENDIF.

    DATA ls_shopify_order TYPE ts_shopify_order.

    TRY.
        /ui2/cl_json=>deserialize(
          EXPORTING json = iv_shopify_json
          CHANGING  data = ls_shopify_order
        ).

        es_so_header   = map_so_header(   ls_shopify_order ).
        et_so_items    = map_so_items(    ls_shopify_order ).
        et_so_partners = map_so_partners( ls_shopify_order ).
        et_so_pricing  = map_so_pricing(  ls_shopify_order ).
        et_so_text     = map_so_text(     ls_shopify_order ).
        et_tax_recon   = get_tax_reconciliation( ls_shopify_order ).

        ev_status = 0.

      CATCH cx_root INTO DATA(lx_map).
        ev_status  = 500.
        ev_message = |Mapping error: { lx_map->get_text( ) }|.

        write_log(
          iv_shopify_so_id = COND #( WHEN ls_shopify_order-order_number IS NOT INITIAL
                                     THEN |{ ls_shopify_order-order_number }|
                                     ELSE space )
          iv_status  = ev_status
          iv_message = ev_message ).
    ENDTRY.

  ENDMETHOD.


  METHOD write_log.

    DATA ls_log TYPE ztb_so_log.

    TRY.
        ls_log-log_uuid = cl_system_uuid=>create_uuid_x16_static( ).
      CATCH cx_uuid_error.
        RETURN.
    ENDTRY.

    ls_log-shopify_so_id = iv_shopify_so_id.
    ls_log-sap_so_id     = space.
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


  METHOD map_so_header.
    rs_sap_so = VALUE #(
      sales_order_type_2        = 'OR'
      sold_to_party              = determine_sold_to_party( is_shopify_order )
      sales_organization          = '1000'
      distribution_channel        = '50'
      organization_division       = '20'
      purchase_order_by_customer  = |{ is_shopify_order-order_number }|
      requested_delivery_date     = convert_date( is_shopify_order-created_at )
      transaction_currency        = is_shopify_order-currency
      customer_payment_terms      = is_shopify_order-payment_terms-payment_terms_name
      shipping_condition          = COND #( WHEN is_shopify_order-shipping_lines IS NOT INITIAL
                                             THEN gc_shpcond_with_fee
                                             ELSE gc_shpcond_no_fee )
      sddocument_reason           = gc_sd_document_reason
    ).
  ENDMETHOD.


  METHOD map_so_text.
    IF is_shopify_order-note IS NOT INITIAL.
      APPEND VALUE #(
        language  = gc_note_language
        long_text = is_shopify_order-note
      ) TO rt_sap_text.
    ENDIF.
  ENDMETHOD.


  METHOD determine_sold_to_party.
    IF is_shopify_order-customer-id IS NOT INITIAL.
      rv_bp = is_shopify_order-customer-id.
    ELSE.
      rv_bp = gc_one_time_customer.
    ENDIF.
  ENDMETHOD.


  METHOD map_so_items.
    DATA lv_item_no TYPE i VALUE 10.

    LOOP AT is_shopify_order-line_items INTO DATA(ls_line_item).
      APPEND VALUE #(
        sales_order_item            = |{ lv_item_no }|
        product                      = ls_line_item-sku
        sales_order_item_text        = ls_line_item-title
        requested_quantity           = |{ ls_line_item-quantity }|
        requested_quantity_sapunit   = gc_uom_ea
        plant                        = is_shopify_order-location_id
        transaction_currency         = is_shopify_order-currency
      ) TO rt_sap_items.
      lv_item_no = lv_item_no + 10.
    ENDLOOP.
  ENDMETHOD.


  METHOD map_so_partners.

    IF is_shopify_order-shipping_address IS NOT INITIAL.
      APPEND build_address_partner(
        iv_partner_function = 'SP'
        is_address           = is_shopify_order-shipping_address
        iv_email              = is_shopify_order-email
        iv_locale             = is_shopify_order-customer_locale
      ) TO rt_sap_partners.

      APPEND build_address_partner(
        iv_partner_function = 'WE'
        is_address           = is_shopify_order-shipping_address
        iv_email              = is_shopify_order-email
        iv_locale             = is_shopify_order-customer_locale
      ) TO rt_sap_partners.
    ENDIF.

    IF is_shopify_order-billing_address IS NOT INITIAL.
      APPEND build_address_partner(
        iv_partner_function = 'RE'
        is_address           = is_shopify_order-billing_address
        iv_email              = is_shopify_order-email
        iv_locale             = is_shopify_order-customer_locale
        iv_customer_bp        = space
      ) TO rt_sap_partners.
    ENDIF.

  ENDMETHOD.


  METHOD build_address_partner.
    DATA lv_street  TYPE string.
    DATA lv_suffix1 TYPE string.

    split_street(
      EXPORTING
        iv_address1 = is_address-address1
        iv_address2 = is_address-address2
      IMPORTING
        ev_street   = lv_street
        ev_suffix1  = lv_suffix1
    ).

    rs_partner = VALUE #(
      partner_function          = iv_partner_function
      customer                   = iv_customer_bp
      business_partner_name_1   = is_address-name
      business_partner_name_2   = is_address-first_name
      business_partner_name_3   = is_address-last_name
      street_name                 = lv_street
      street_suffix_name_1        = lv_suffix1
      district_name                = is_address-province
      city_name                    = is_address-city
      postal_code                   = is_address-zip
      country                       = is_address-country_code
*      language                      = iv_locale
      email_address                  = iv_email
      phone_number                   = is_address-phone
    ).
  ENDMETHOD.


  METHOD split_street.
    DATA lv_combined TYPE string.
    DATA lt_parts    TYPE TABLE OF string.

    lv_combined = |{ iv_address2 }, { iv_address1 }|.
    SPLIT lv_combined AT ',' INTO TABLE lt_parts.

    READ TABLE lt_parts INDEX 1 INTO ev_street.
    READ TABLE lt_parts INDEX 2 INTO ev_suffix1.

    ev_street  = condense( ev_street ).
    ev_suffix1 = condense( ev_suffix1 ).
  ENDMETHOD.


  METHOD map_so_pricing.
    DATA lv_item_no TYPE i VALUE 10.

    LOOP AT is_shopify_order-line_items INTO DATA(ls_line_item).
      APPEND VALUE #(
        sales_order_item            = |{ lv_item_no }|
        pricing_procedure_step       = '10'
        condition_type                = gc_condition_pr00
        condition_rate_amount         = ls_line_item-price
        condition_currency            = is_shopify_order-presentment_currency
        condition_is_manually_chan   = abap_true
      ) TO rt_sap_pricing.

      lv_item_no = lv_item_no + 10.
    ENDLOOP.

    READ TABLE is_shopify_order-shipping_lines INDEX 1 INTO DATA(ls_shipping_line).
    IF sy-subrc = 0.
      APPEND VALUE #(
        sales_order_item      = space
        pricing_procedure_step = '10'
        condition_type          = gc_condition_ybhd
        condition_rate_amount   = ls_shipping_line-price
        condition_currency      = is_shopify_order-presentment_currency
      ) TO rt_sap_pricing.
    ENDIF.
  ENDMETHOD.


  METHOD get_tax_reconciliation.
    DATA lv_item_no TYPE i VALUE 10.

    LOOP AT is_shopify_order-line_items INTO DATA(ls_line_item).
      LOOP AT ls_line_item-tax_lines INTO DATA(ls_tax).
        APPEND VALUE #(
          sales_order_item    = |{ lv_item_no }|
          shopify_tax_amount  = ls_tax-price
          shopify_tax_title   = ls_tax-title
        ) TO rt_recon.
      ENDLOOP.
      lv_item_no = lv_item_no + 10.
    ENDLOOP.
  ENDMETHOD.


  METHOD convert_date.
    DATA lv_date_str TYPE string.
    lv_date_str = iv_shopify_date(10).
    REPLACE ALL OCCURRENCES OF '-' IN lv_date_str WITH ''.
    rv_sap_date = lv_date_str.
  ENDMETHOD.

ENDCLASS.
