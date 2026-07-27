"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>com.sap.gateway.srvd_a2x.api_salesorder.v0001</em>
CLASS zscm_so_integration DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">Types for "OData Primitive Types"</p>
      BEGIN OF tys_types_for_prim_types,
        "! Used for primitive type PRICING_TYPE
        pricing_type               TYPE c LENGTH 1,
        "! Used for primitive type PRICING_TYPE_2
        pricing_type_2             TYPE c LENGTH 1,
        "! Used for primitive type VAR_CONFIGN_INSTCE_HIER_NO
        var_confign_instce_hier_no TYPE int4,
      END OF tys_types_for_prim_types.

    TYPES:
      "! <p class="shorttext synchronized">Types for primitive collection fields</p>
      BEGIN OF tys_types_for_prim_colls,
        "! additionalTargets
        "! Used for TYS_SAP_MESSAGE-ADDITIONAL_TARGETS
        additional_targets TYPE string,
      END OF tys_types_for_prim_colls.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of D_VAR_CNF_SET_ASSGD_VALS_V</p>
      BEGIN OF tys_value_controls_1,
        "! VAR_CNF_CHARC_FROM_DATE
        var_cnf_charc_from_date TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_1.

    TYPES:
      "! <p class="shorttext synchronized">D_VarCnfSetAssgdValsValueP</p>
      BEGIN OF tys_d_var_cnf_set_assgd_vals_v,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_1,
        "! VarCnfCharacteristicValue
        var_cnf_characteristic_val TYPE c LENGTH 70,
        "! VarCnfCharcFromQuantity
        var_cnf_charc_from_quantit TYPE decfloat34,
        "! VarCnfCharcFromNumericValue
        var_cnf_charc_from_numeric TYPE decfloat34,
        "! VarCnfCharcFromDate
        var_cnf_charc_from_date    TYPE datn,
        "! VarCnfCharcFromTime
        var_cnf_charc_from_time    TYPE timn,
        "! VarCnfCharcFromAmount
        var_cnf_charc_from_amount  TYPE decfloat34,
      END OF tys_d_var_cnf_set_assgd_vals_v,
      "! <p class="shorttext synchronized">List of D_VarCnfSetAssgdValsValueP</p>
      tyt_d_var_cnf_set_assgd_vals_v TYPE STANDARD TABLE OF tys_d_var_cnf_set_assgd_vals_v WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">D_VarCnfSetAssgdValsCharcP</p>
      BEGIN OF tys_d_var_cnf_set_assgd_vals_c,
        "! Characteristic
        characteristic TYPE c LENGTH 30,
        "! _AssignedValue
        assigned_value TYPE tyt_d_var_cnf_set_assgd_vals_v,
      END OF tys_d_var_cnf_set_assgd_vals_c,
      "! <p class="shorttext synchronized">List of D_VarCnfSetAssgdValsCharcP</p>
      tyt_d_var_cnf_set_assgd_vals_c TYPE STANDARD TABLE OF tys_d_var_cnf_set_assgd_vals_c WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">D_VarCnfSetAssgdValsInstanceP</p>
      BEGIN OF tys_d_var_cnf_set_assgd_vals_i,
        "! VarConfignInstceHierNodeID
        var_confign_instce_hier_no TYPE int4,
        "! VarConfignInstceHierParNodeID
        var_confign_instce_hier_pa TYPE int4,
        "! Product
        product                    TYPE c LENGTH 18,
        "! BillOfMaterialItemNumber
        bill_of_material_item_numb TYPE c LENGTH 4,
        "! IdentifierBOMItem
        identifier_bomitem         TYPE c LENGTH 8,
        "! _Characteristic
        characteristic             TYPE tyt_d_var_cnf_set_assgd_vals_c,
      END OF tys_d_var_cnf_set_assgd_vals_i,
      "! <p class="shorttext synchronized">List of D_VarCnfSetAssgdValsInstanceP</p>
      tyt_d_var_cnf_set_assgd_vals_i TYPE STANDARD TABLE OF tys_d_var_cnf_set_assgd_vals_i WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of SAP_MESSAGE</p>
      BEGIN OF tys_value_controls_2,
        "! TARGET
        target       TYPE /iwbep/v4_value_control,
        "! LONGTEXT_URL
        longtext_url TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_2.

    TYPES:
      "! <p class="shorttext synchronized">SAP__Message</p>
      BEGIN OF tys_sap_message,
        "! <em>Value Control Structure</em>
        value_controls     TYPE tys_value_controls_2,
        "! code
        code               TYPE string,
        "! message
        message            TYPE string,
        "! target
        target             TYPE string,
        "! additionalTargets
        additional_targets TYPE STANDARD TABLE OF tys_types_for_prim_colls-additional_targets WITH DEFAULT KEY,
        "! transition
        transition         TYPE abap_bool,
        "! numericSeverity
        numeric_severity   TYPE int1,
        "! longtextUrl
        longtext_url       TYPE string,
      END OF tys_sap_message,
      "! <p class="shorttext synchronized">List of SAP__Message</p>
      tyt_sap_message TYPE STANDARD TABLE OF tys_sap_message WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of SALES_ORDER_ITEM_TYPE</p>
      BEGIN OF tys_value_controls_3,
        "! HIGHER_LEVEL_ITEM
        higher_level_item          TYPE /iwbep/v4_value_control,
        "! REFERENCE_SDDOCUMENT
        reference_sddocument       TYPE /iwbep/v4_value_control,
        "! REFERENCE_SDDOCUMENT_ITEM
        reference_sddocument_item  TYPE /iwbep/v4_value_control,
        "! REFERENCE_SDDOCUMENT_CATEG
        reference_sddocument_categ TYPE /iwbep/v4_value_control,
        "! BUSINESS_SOLUTION_ORDER_IT
        business_solution_order_it TYPE /iwbep/v4_value_control,
        "! BUS_SOLN_ORD_ITEM_BUNDLE_I
        bus_soln_ord_item_bundle_i TYPE /iwbep/v4_value_control,
        "! REQUESTED_DELIVERY_DATE
        requested_delivery_date    TYPE /iwbep/v4_value_control,
        "! CONFIRMED_DELIVERY_DATE
        confirmed_delivery_date    TYPE /iwbep/v4_value_control,
        "! PRICING_DATE
        pricing_date               TYPE /iwbep/v4_value_control,
        "! SERVICES_RENDERED_DATE
        services_rendered_date     TYPE /iwbep/v4_value_control,
        "! BILLING_DOCUMENT_DATE
        billing_document_date      TYPE /iwbep/v4_value_control,
        "! FIXED_VALUE_DATE
        fixed_value_date           TYPE /iwbep/v4_value_control,
        "! SLS_CONTR_AUTO_ASSGMT_IDFO
        sls_contr_auto_assgmt_idfo TYPE /iwbep/v4_value_control,
        "! ITEM_PARTNER
        item_partner               TYPE /iwbep/v4_value_control,
        "! ITEM_PRICING_ELEMENT
        item_pricing_element       TYPE /iwbep/v4_value_control,
        "! ITEM_RELATED_OBJECT
        item_related_object        TYPE /iwbep/v4_value_control,
        "! ITEM_TEXT
        item_text                  TYPE /iwbep/v4_value_control,
        "! SCHEDULE_LINE
        schedule_line              TYPE /iwbep/v4_value_control,
        "! VARIANT_CONFIGURATION
        variant_configuration      TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_3.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of SALES_ORDER_TYPE</p>
      BEGIN OF tys_value_controls_4,
        "! CREATION_DATE
        creation_date              TYPE /iwbep/v4_value_control,
        "! LAST_CHANGE_DATE_TIME
        last_change_date_time      TYPE /iwbep/v4_value_control,
        "! CUSTOMER_PURCHASE_ORDER_DA
        customer_purchase_order_da TYPE /iwbep/v4_value_control,
        "! REFERENCE_SDDOCUMENT
        reference_sddocument       TYPE /iwbep/v4_value_control,
        "! REFERENCE_SDDOCUMENT_CATEG
        reference_sddocument_categ TYPE /iwbep/v4_value_control,
        "! SALES_ORDER_DATE
        sales_order_date           TYPE /iwbep/v4_value_control,
        "! REQUESTED_DELIVERY_DATE
        requested_delivery_date    TYPE /iwbep/v4_value_control,
        "! PRICING_DATE
        pricing_date               TYPE /iwbep/v4_value_control,
        "! SERVICES_RENDERED_DATE
        services_rendered_date     TYPE /iwbep/v4_value_control,
        "! BILLING_DOCUMENT_DATE
        billing_document_date      TYPE /iwbep/v4_value_control,
        "! FIXED_VALUE_DATE
        fixed_value_date           TYPE /iwbep/v4_value_control,
        "! SLS_CONTR_AUTO_ASSGMT_IDFO
        sls_contr_auto_assgmt_idfo TYPE /iwbep/v4_value_control,
        "! ITEM
        item                       TYPE /iwbep/v4_value_control,
        "! PARTNER
        partner                    TYPE /iwbep/v4_value_control,
        "! PRICING_ELEMENT
        pricing_element            TYPE /iwbep/v4_value_control,
        "! RELATED_OBJECT
        related_object             TYPE /iwbep/v4_value_control,
        "! TEXT
        text                       TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_4.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of VAR_CONFIGN_ASSIGNED_VALUE</p>
      BEGIN OF tys_value_controls_5,
        "! VAR_CNF_CHARACTERISTIC_VAL
        var_cnf_characteristic_val TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_VALUE_DESCRI
        var_cnf_charc_value_descri TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_FROM_QUANTIT
        var_cnf_charc_from_quantit TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_FROM_QUANT_2
        var_cnf_charc_from_quant_2 TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_FROM_QUANT_3
        var_cnf_charc_from_quant_3 TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_TO_QUANTITY
        var_cnf_charc_to_quantity  TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_TO_QUANTIT_2
        var_cnf_charc_to_quantit_2 TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_TO_QUANTIT_3
        var_cnf_charc_to_quantit_3 TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_FROM_NUMERIC
        var_cnf_charc_from_numeric TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_TO_NUMERIC_V
        var_cnf_charc_to_numeric_v TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_FROM_DATE
        var_cnf_charc_from_date    TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_FROM_TIME
        var_cnf_charc_from_time    TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_FROM_AMOUNT
        var_cnf_charc_from_amount  TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_TO_AMOUNT
        var_cnf_charc_to_amount    TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_CURRENCY
        var_cnf_charc_currency     TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_5.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of SALES_ORDER_SCHEDULE_LIN_2</p>
      BEGIN OF tys_value_controls_6,
        "! SCHEDULE_LINE_ORDER_QUANTI
        schedule_line_order_quanti TYPE /iwbep/v4_value_control,
        "! REQUESTED_DELIVERY_DATE
        requested_delivery_date    TYPE /iwbep/v4_value_control,
        "! CONFIRMED_DELIVERY_DATE
        confirmed_delivery_date    TYPE /iwbep/v4_value_control,
        "! CONFD_ORDER_QTY_BY_MATL_AV
        confd_order_qty_by_matl_av TYPE /iwbep/v4_value_control,
        "! PURCHASE_REQUISITION_ITEM
        purchase_requisition_item  TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_6.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of SALES_ORDER_PRICING_ELEM_2</p>
      BEGIN OF tys_value_controls_7,
        "! CONDITION_RATE_AMOUNT
        condition_rate_amount      TYPE /iwbep/v4_value_control,
        "! CONDITION_QUANTITY
        condition_quantity         TYPE /iwbep/v4_value_control,
        "! CONDITION_BASE_QUANTITY
        condition_base_quantity    TYPE /iwbep/v4_value_control,
        "! CONDITION_RATE_RATIO
        condition_rate_ratio       TYPE /iwbep/v4_value_control,
        "! CONDITION_AMOUNT
        condition_amount           TYPE /iwbep/v4_value_control,
        "! CONDITION_BASE_AMOUNT
        condition_base_amount      TYPE /iwbep/v4_value_control,
        "! CNDN_ROUNDING_OFF_DIFF_AMO
        cndn_rounding_off_diff_amo TYPE /iwbep/v4_value_control,
        "! CONDITION_INACTIVE_REASON
        condition_inactive_reason  TYPE /iwbep/v4_value_control,
        "! CONDITION_CLASS
        condition_class            TYPE /iwbep/v4_value_control,
        "! CONDITION_CONTROL
        condition_control          TYPE /iwbep/v4_value_control,
        "! CONDITION_ORIGIN
        condition_origin           TYPE /iwbep/v4_value_control,
        "! CONDITION_IS_FOR_STATISTIC
        condition_is_for_statistic TYPE /iwbep/v4_value_control,
        "! CONDITION_IS_MANUALLY_CHAN
        condition_is_manually_chan TYPE /iwbep/v4_value_control,
        "! TAX_CODE
        tax_code                   TYPE /iwbep/v4_value_control,
        "! VARIANT_CONDITION
        variant_condition          TYPE /iwbep/v4_value_control,
        "! IS_GROUP_CONDITION
        is_group_condition         TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_7.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of SALES_ORDER_ITEM_PRICING_2</p>
      BEGIN OF tys_value_controls_8,
        "! CONDITION_RATE_AMOUNT
        condition_rate_amount      TYPE /iwbep/v4_value_control,
        "! CONDITION_QUANTITY
        condition_quantity         TYPE /iwbep/v4_value_control,
        "! CONDITION_BASE_QUANTITY
        condition_base_quantity    TYPE /iwbep/v4_value_control,
        "! CONDITION_RATE_RATIO
        condition_rate_ratio       TYPE /iwbep/v4_value_control,
        "! CONDITION_AMOUNT
        condition_amount           TYPE /iwbep/v4_value_control,
        "! CONDITION_BASE_AMOUNT
        condition_base_amount      TYPE /iwbep/v4_value_control,
        "! CNDN_ROUNDING_OFF_DIFF_AMO
        cndn_rounding_off_diff_amo TYPE /iwbep/v4_value_control,
        "! CONDITION_INACTIVE_REASON
        condition_inactive_reason  TYPE /iwbep/v4_value_control,
        "! CONDITION_CLASS
        condition_class            TYPE /iwbep/v4_value_control,
        "! CONDITION_CONTROL
        condition_control          TYPE /iwbep/v4_value_control,
        "! CONDITION_ORIGIN
        condition_origin           TYPE /iwbep/v4_value_control,
        "! CONDITION_IS_FOR_STATISTIC
        condition_is_for_statistic TYPE /iwbep/v4_value_control,
        "! CONDITION_IS_MANUALLY_CHAN
        condition_is_manually_chan TYPE /iwbep/v4_value_control,
        "! TAX_CODE
        tax_code                   TYPE /iwbep/v4_value_control,
        "! VARIANT_CONDITION
        variant_condition          TYPE /iwbep/v4_value_control,
        "! IS_GROUP_CONDITION
        is_group_condition         TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_8.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of VAR_CONFIGN_CHARACTERISTIC</p>
      BEGIN OF tys_value_controls_9,
        "! CURRENCY
        currency              TYPE /iwbep/v4_value_control,
        "! CHARC_VALUE_UNIT
        charc_value_unit      TYPE /iwbep/v4_value_control,
        "! VAR_CNF_CHARC_ISOUNIT
        var_cnf_charc_isounit TYPE /iwbep/v4_value_control,
        "! ASSIGNED_VALUE
        assigned_value        TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_9.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of SALES_ORDER_PARTNER_TYPE</p>
      BEGIN OF tys_value_controls_10,
        "! CUSTOMER
        customer                   TYPE /iwbep/v4_value_control,
        "! SUPPLIER
        supplier                   TYPE /iwbep/v4_value_control,
        "! PERSONNEL
        personnel                  TYPE /iwbep/v4_value_control,
        "! CONTACT_PERSON
        contact_person             TYPE /iwbep/v4_value_control,
        "! WORK_ASSIGNMENT_EXTERNAL_I
        work_assignment_external_i TYPE /iwbep/v4_value_control,
        "! ADDRESS_ID
        address_id                 TYPE /iwbep/v4_value_control,
        "! ADDRESS_PERSON_ID
        address_person_id          TYPE /iwbep/v4_value_control,
        "! UNLOADING_POINT_NAME
        unloading_point_name       TYPE /iwbep/v4_value_control,
        "! VATREGISTRATION
        vatregistration            TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_10.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of VARIANT_CONFIGURATION_INST</p>
      BEGIN OF tys_value_controls_11,
        "! PRODUCT
        product                    TYPE /iwbep/v4_value_control,
        "! IDENTIFIER_BOMITEM
        identifier_bomitem         TYPE /iwbep/v4_value_control,
        "! BILL_OF_MATERIAL_ITEM_NUMB
        bill_of_material_item_numb TYPE /iwbep/v4_value_control,
        "! VARIANT_CONFIGURATION_QUAN
        variant_configuration_quan TYPE /iwbep/v4_value_control,
        "! VAR_CONFIGN_QUANTITY_UNIT
        var_confign_quantity_unit  TYPE /iwbep/v4_value_control,
        "! VAR_CONFIGN_QUANTITY_ISOUN
        var_confign_quantity_isoun TYPE /iwbep/v4_value_control,
        "! CHARACTERISTIC
        characteristic             TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_11.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of SALES_ORDER_ITEM_PARTNER_T</p>
      BEGIN OF tys_value_controls_12,
        "! CUSTOMER
        customer                   TYPE /iwbep/v4_value_control,
        "! SUPPLIER
        supplier                   TYPE /iwbep/v4_value_control,
        "! PERSONNEL
        personnel                  TYPE /iwbep/v4_value_control,
        "! CONTACT_PERSON
        contact_person             TYPE /iwbep/v4_value_control,
        "! WORK_ASSIGNMENT_EXTERNAL_I
        work_assignment_external_i TYPE /iwbep/v4_value_control,
        "! ADDRESS_ID
        address_id                 TYPE /iwbep/v4_value_control,
        "! ADDRESS_PERSON_ID
        address_person_id          TYPE /iwbep/v4_value_control,
        "! UNLOADING_POINT_NAME
        unloading_point_name       TYPE /iwbep/v4_value_control,
        "! VATREGISTRATION
        vatregistration            TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_12.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of VARIANT_CONFIGURATION_TYPE</p>
      BEGIN OF tys_value_controls_13,
        "! LAST_CHANGE_DATE_TIME
        last_change_date_time TYPE /iwbep/v4_value_control,
        "! INSTANCE
        instance              TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_13.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of action SetAssignedValues</p>
      "! <em>with the internal name</em> SET_ASSIGNED_VALUES
      BEGIN OF tys_parameters_1,
        "! VarConfignInstceHierNodeID
        var_confign_instce_hier_no TYPE int4,
        "! _Characteristic
        characteristic             TYPE tyt_d_var_cnf_set_assgd_vals_c,
        "! _SubordInstance
        subord_instance            TYPE tyt_d_var_cnf_set_assgd_vals_i,
      END OF tys_parameters_1,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_1</p>
      tyt_parameters_1 TYPE STANDARD TABLE OF tys_parameters_1 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of action UpdatePrices</p>
      "! <em>with the internal name</em> UPDATE_PRICES
      BEGIN OF tys_parameters_2,
        "! PricingType
        pricing_type TYPE c LENGTH 1,
      END OF tys_parameters_2,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_2</p>
      tyt_parameters_2 TYPE STANDARD TABLE OF tys_parameters_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of action UpdatePrices</p>
      "! <em>with the internal name</em> UPDATE_PRICES_2
      BEGIN OF tys_parameters_3,
        "! PricingType
        pricing_type TYPE c LENGTH 1,
      END OF tys_parameters_3,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_3</p>
      tyt_parameters_3 TYPE STANDARD TABLE OF tys_parameters_3 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrderItemPartner_Type</p>
      BEGIN OF tys_sales_order_item_partner_t,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_12,
        "! <em>Key property</em> SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! <em>Key property</em> SalesOrderItem
        sales_order_item           TYPE c LENGTH 6,
        "! <em>Key property</em> PartnerFunction
        partner_function           TYPE c LENGTH 2,
        "! Customer
        customer                   TYPE c LENGTH 10,
        "! Supplier
        supplier                   TYPE c LENGTH 10,
        "! Personnel
        personnel                  TYPE c LENGTH 8,
        "! ContactPerson
        contact_person             TYPE c LENGTH 10,
        "! WorkAssignmentExternalID
        work_assignment_external_i TYPE c LENGTH 100,
        "! ReferenceBusinessPartner
        reference_business_partner TYPE c LENGTH 10,
        "! BusinessPartnerName1
        business_partner_name_1    TYPE c LENGTH 40,
        "! BusinessPartnerName2
        business_partner_name_2    TYPE c LENGTH 40,
        "! BusinessPartnerName3
        business_partner_name_3    TYPE c LENGTH 40,
        "! BusinessPartnerName4
        business_partner_name_4    TYPE c LENGTH 40,
        "! AddressID
        address_id                 TYPE c LENGTH 10,
        "! AddressPersonID
        address_person_id          TYPE c LENGTH 10,
        "! AddressObjectType
        address_object_type        TYPE c LENGTH 1,
        "! StreetName
        street_name                TYPE c LENGTH 60,
        "! StreetPrefixName1
        street_prefix_name_1       TYPE c LENGTH 40,
        "! StreetPrefixName2
        street_prefix_name_2       TYPE c LENGTH 40,
        "! StreetSuffixName1
        street_suffix_name_1       TYPE c LENGTH 40,
        "! StreetSuffixName2
        street_suffix_name_2       TYPE c LENGTH 40,
        "! HouseNumber
        house_number               TYPE c LENGTH 10,
        "! PostalCode
        postal_code                TYPE c LENGTH 10,
        "! CityName
        city_name                  TYPE c LENGTH 40,
        "! DistrictName
        district_name              TYPE c LENGTH 40,
        "! Region
        region                     TYPE c LENGTH 3,
        "! Country
        country                    TYPE c LENGTH 3,
        "! PhoneNumberCountry
        phone_number_country       TYPE c LENGTH 3,
        "! PhoneNumber
        phone_number               TYPE c LENGTH 30,
        "! PhoneNumberExtension
        phone_number_extension     TYPE c LENGTH 10,
        "! MobilePhoneCountry
        mobile_phone_country       TYPE c LENGTH 3,
        "! MobilePhoneNumber
        mobile_phone_number        TYPE c LENGTH 30,
        "! FaxNumberCountry
        fax_number_country         TYPE c LENGTH 3,
        "! FaxNumber
        fax_number                 TYPE c LENGTH 30,
        "! FaxNumberExtension
        fax_number_extension       TYPE c LENGTH 10,
        "! InternationalPhoneNumber
        international_phone_number TYPE c LENGTH 30,
        "! InternationalMobilePhoneNumber
        international_mobile_phone TYPE c LENGTH 30,
        "! InternationalFaxNumber
        international_fax_number   TYPE c LENGTH 30,
        "! POBox
        pobox                      TYPE c LENGTH 10,
        "! POBoxPostalCode
        pobox_postal_code          TYPE c LENGTH 10,
        "! FormOfAddress
        form_of_address            TYPE c LENGTH 4,
        "! CorrespondenceLanguage
        correspondence_language    TYPE c LENGTH 2,
        "! EmailAddress
        email_address              TYPE c LENGTH 241,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TransportZone
        transport_zone             TYPE c LENGTH 10,
        "! UnloadingPointName
        unloading_point_name       TYPE c LENGTH 25,
        "! VATRegistration
        vatregistration            TYPE c LENGTH 20,
        "! PartnerIsSpecificForSDDocItem
        partner_is_specific_for_sd TYPE abap_bool,
        "! SDDocPartnerAddrIsDocSpecific
        sddoc_partner_addr_is_doc  TYPE abap_bool,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_sales_order_item_partner_t,
      "! <p class="shorttext synchronized">List of SalesOrderItemPartner_Type</p>
      tyt_sales_order_item_partner_t TYPE STANDARD TABLE OF tys_sales_order_item_partner_t WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrderItemPricingElmnt_Type</p>
      BEGIN OF tys_sales_order_item_pricing_2,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_8,
        "! <em>Key property</em> SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! <em>Key property</em> SalesOrderItem
        sales_order_item           TYPE c LENGTH 6,
        "! <em>Key property</em> PricingProcedureStep
        pricing_procedure_step     TYPE c LENGTH 3,
        "! <em>Key property</em> PricingProcedureCounter
        pricing_procedure_counter  TYPE c LENGTH 3,
        "! ConditionType
        condition_type             TYPE c LENGTH 4,
        "! PriceElementDescription
        price_element_description  TYPE c LENGTH 40,
        "! ConditionCalculationType
        condition_calculation_type TYPE c LENGTH 3,
        "! ConditionRateAmount
        condition_rate_amount      TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionCurrency
        condition_currency         TYPE c LENGTH 3,
        "! ConditionQuantity
        condition_quantity         TYPE p LENGTH 3 DECIMALS 0,
        "! ConditionBaseQuantity
        condition_base_quantity    TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionQuantitySAPUnit
        condition_quantity_sapunit TYPE c LENGTH 3,
        "! ConditionQuantityISOUnit
        condition_quantity_isounit TYPE c LENGTH 3,
        "! ConditionRateRatio
        condition_rate_ratio       TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionRateRatioSAPUnit
        condition_rate_ratio_sapun TYPE c LENGTH 3,
        "! ConditionRateRatioISOUnit
        condition_rate_ratio_isoun TYPE c LENGTH 3,
        "! ConditionAmount
        condition_amount           TYPE decfloat16,
        "! ConditionBaseAmount
        condition_base_amount      TYPE p LENGTH 13 DECIMALS 9,
        "! TransactionCurrency
        transaction_currency       TYPE c LENGTH 3,
        "! CndnRoundingOffDiffAmount
        cndn_rounding_off_diff_amo TYPE decfloat16,
        "! ConditionInactiveReason
        condition_inactive_reason  TYPE c LENGTH 1,
        "! ConditionClass
        condition_class            TYPE c LENGTH 1,
        "! ConditionControl
        condition_control          TYPE c LENGTH 1,
        "! ConditionOrigin
        condition_origin           TYPE c LENGTH 1,
        "! ConditionIsForStatistics
        condition_is_for_statistic TYPE abap_bool,
        "! ConditionIsManuallyChanged
        condition_is_manually_chan TYPE abap_bool,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! VariantCondition
        variant_condition          TYPE c LENGTH 26,
        "! IsGroupCondition
        is_group_condition         TYPE abap_bool,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_sales_order_item_pricing_2,
      "! <p class="shorttext synchronized">List of SalesOrderItemPricingElmnt_Type</p>
      tyt_sales_order_item_pricing_2 TYPE STANDARD TABLE OF tys_sales_order_item_pricing_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrderItemRelatedObject_Type</p>
      BEGIN OF tys_sales_order_item_related_2,
        "! <em>Key property</em> SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! <em>Key property</em> SalesOrderItem
        sales_order_item           TYPE c LENGTH 6,
        "! <em>Key property</em> SDDocRelatedObjectSequenceNmbr
        sddoc_related_object_seque TYPE c LENGTH 4,
        "! SDDocumentRelatedObjectType
        sddocument_related_object  TYPE c LENGTH 5,
        "! SDDocRelatedObjectSystem
        sddoc_related_object_syste TYPE c LENGTH 60,
        "! SDDocRelatedObjectReference1
        sddoc_related_object_refer TYPE c LENGTH 60,
        "! SDDocRelatedObjectReference2
        sddoc_related_object_ref_2 TYPE c LENGTH 60,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_sales_order_item_related_2,
      "! <p class="shorttext synchronized">List of SalesOrderItemRelatedObject_Type</p>
      tyt_sales_order_item_related_2 TYPE STANDARD TABLE OF tys_sales_order_item_related_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrderItemText_Type</p>
      BEGIN OF tys_sales_order_item_text_type,
        "! <em>Key property</em> SalesOrder
        sales_order      TYPE c LENGTH 10,
        "! <em>Key property</em> SalesOrderItem
        sales_order_item TYPE c LENGTH 6,
        "! <em>Key property</em> Language
        language         TYPE c LENGTH 2,
        "! <em>Key property</em> LongTextID
        long_text_id     TYPE c LENGTH 4,
        "! LongText
        long_text        TYPE string,
        "! SAP__Messages
        sap_messages     TYPE tyt_sap_message,
        "! odata.etag
        etag             TYPE string,
      END OF tys_sales_order_item_text_type,
      "! <p class="shorttext synchronized">List of SalesOrderItemText_Type</p>
      tyt_sales_order_item_text_type TYPE STANDARD TABLE OF tys_sales_order_item_text_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrderItem_Type</p>
      BEGIN OF tys_sales_order_item_type,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_3,
        "! <em>Key property</em> SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! <em>Key property</em> SalesOrderItem
        sales_order_item           TYPE c LENGTH 6,
        "! HigherLevelItem
        higher_level_item          TYPE c LENGTH 6,
        "! SalesOrderItemCategory
        sales_order_item_category  TYPE c LENGTH 4,
        "! SalesOrderItemText
        sales_order_item_text      TYPE c LENGTH 40,
        "! Product
        product                    TYPE c LENGTH 18,
        "! OriginallyRequestedMaterial
        originally_requested_mater TYPE c LENGTH 18,
        "! ProductGroup
        product_group              TYPE c LENGTH 9,
        "! MaterialByCustomer
        material_by_customer       TYPE c LENGTH 35,
        "! InternationalArticleNumber
        international_article_numb TYPE c LENGTH 18,
        "! PurchaseOrderByCustomer
        purchase_order_by_customer TYPE c LENGTH 35,
        "! UnderlyingPurchaseOrderItem
        underlying_purchase_order  TYPE c LENGTH 6,
        "! CorrespncExternalReference
        correspnc_external_referen TYPE c LENGTH 12,
        "! PurchaseOrderByShipToParty
        purchase_order_by_ship_to  TYPE c LENGTH 35,
        "! UndrlgPurOrdItmByShipToParty
        undrlg_pur_ord_itm_by_ship TYPE c LENGTH 6,
        "! CorrespncExtRefByShipToParty
        correspnc_ext_ref_by_ship  TYPE c LENGTH 12,
        "! ConfdDelivQtyInOrderQtyUnit
        confd_deliv_qty_in_order_q TYPE p LENGTH 8 DECIMALS 3,
        "! OrderQuantitySAPUnit
        order_quantity_sapunit     TYPE c LENGTH 3,
        "! OrderQuantityISOUnit
        order_quantity_isounit     TYPE c LENGTH 3,
        "! RequestedQuantity
        requested_quantity         TYPE p LENGTH 8 DECIMALS 3,
        "! RequestedQuantitySAPUnit
        requested_quantity_sapunit TYPE c LENGTH 3,
        "! RequestedQuantityISOUnit
        requested_quantity_isounit TYPE c LENGTH 3,
        "! ReferenceSDDocument
        reference_sddocument       TYPE c LENGTH 10,
        "! ReferenceSDDocumentItem
        reference_sddocument_item  TYPE c LENGTH 6,
        "! ReferenceSDDocumentCategory
        reference_sddocument_categ TYPE c LENGTH 4,
        "! BusinessSolutionOrderItem
        business_solution_order_it TYPE c LENGTH 6,
        "! BusSolnOrdItemBundleItem
        bus_soln_ord_item_bundle_i TYPE c LENGTH 6,
        "! ItemGrossWeight
        item_gross_weight          TYPE p LENGTH 8 DECIMALS 3,
        "! ItemNetWeight
        item_net_weight            TYPE p LENGTH 8 DECIMALS 3,
        "! ItemWeightSAPUnit
        item_weight_sapunit        TYPE c LENGTH 3,
        "! ItemWeightISOUnit
        item_weight_isounit        TYPE c LENGTH 3,
        "! ItemVolume
        item_volume                TYPE p LENGTH 8 DECIMALS 3,
        "! ItemVolumeSAPUnit
        item_volume_sapunit        TYPE c LENGTH 3,
        "! ItemVolumeISOUnit
        item_volume_isounit        TYPE c LENGTH 3,
        "! RequestedDeliveryDate
        requested_delivery_date    TYPE datn,
        "! ConfirmedDeliveryDate
        confirmed_delivery_date    TYPE datn,
        "! PricingDate
        pricing_date               TYPE datn,
        "! ServicesRenderedDate
        services_rendered_date     TYPE datn,
        "! BillingDocumentDate
        billing_document_date      TYPE datn,
        "! NetAmount
        net_amount                 TYPE decfloat16,
        "! TransactionCurrency
        transaction_currency       TYPE c LENGTH 3,
        "! TaxAmount
        tax_amount                 TYPE decfloat16,
        "! Subtotal1Amount
        subtotal_1_amount          TYPE decfloat16,
        "! Subtotal2Amount
        subtotal_2_amount          TYPE decfloat16,
        "! Subtotal3Amount
        subtotal_3_amount          TYPE decfloat16,
        "! Subtotal4Amount
        subtotal_4_amount          TYPE decfloat16,
        "! Subtotal5Amount
        subtotal_5_amount          TYPE decfloat16,
        "! Subtotal6Amount
        subtotal_6_amount          TYPE decfloat16,
        "! CustomerGroup
        customer_group             TYPE c LENGTH 2,
        "! Batch
        batch                      TYPE c LENGTH 10,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! StorageLocation
        storage_location           TYPE c LENGTH 4,
        "! ShippingPoint
        shipping_point             TYPE c LENGTH 4,
        "! ShippingType
        shipping_type              TYPE c LENGTH 2,
        "! Route
        route                      TYPE c LENGTH 6,
        "! DeliveryPriority
        delivery_priority          TYPE c LENGTH 2,
        "! PartialDeliveryIsAllowed
        partial_delivery_is_allowe TYPE c LENGTH 1,
        "! MaxNmbrOfPartialDelivery
        max_nmbr_of_partial_delive TYPE p LENGTH 1 DECIMALS 0,
        "! DeliveryDateTypeRule
        delivery_date_type_rule    TYPE c LENGTH 1,
        "! ReceivingPoint
        receiving_point            TYPE c LENGTH 25,
        "! DeliveryGroup
        delivery_group             TYPE c LENGTH 3,
        "! IncotermsClassification
        incoterms_classification   TYPE c LENGTH 3,
        "! IncotermsLocation1
        incoterms_location_1       TYPE c LENGTH 70,
        "! IncotermsLocation2
        incoterms_location_2       TYPE c LENGTH 70,
        "! IncotermsVersion
        incoterms_version          TYPE c LENGTH 4,
        "! CustomerPaymentTerms
        customer_payment_terms     TYPE c LENGTH 4,
        "! FixedValueDate
        fixed_value_date           TYPE datn,
        "! CustomerPriceGroup
        customer_price_group       TYPE c LENGTH 2,
        "! MaterialPricingGroup
        material_pricing_group     TYPE c LENGTH 2,
        "! BusinessArea
        business_area              TYPE c LENGTH 4,
        "! ProfitCenter
        profit_center              TYPE c LENGTH 10,
        "! MatlAccountAssignmentGroup
        matl_account_assignment_gr TYPE c LENGTH 2,
        "! WBSElementExternalID
        wbselement_external_id     TYPE c LENGTH 24,
        "! ItemBillingBlockReason
        item_billing_block_reason  TYPE c LENGTH 2,
        "! SalesDocumentRjcnReason
        sales_document_rjcn_reason TYPE c LENGTH 2,
        "! SalesDocItemSupplyBlockReason
        sales_doc_item_supply_bloc TYPE c LENGTH 2,
        "! ProductConfiguration
        product_configuration      TYPE c LENGTH 18,
        "! SlsContrAutoAssgmtIDForSlsOrd
        sls_contr_auto_assgmt_idfo TYPE c LENGTH 10,
        "! SDProcessStatus
        sdprocess_status           TYPE c LENGTH 1,
        "! PurchaseConfirmationStatus
        purchase_confirmation_stat TYPE c LENGTH 1,
        "! SDDocumentRejectionStatus
        sddocument_rejection_statu TYPE c LENGTH 1,
        "! DeliveryStatus
        delivery_status            TYPE c LENGTH 1,
        "! BillingBlockStatus
        billing_block_status       TYPE c LENGTH 1,
        "! ItemGeneralIncompletionStatus
        item_general_incompletion  TYPE c LENGTH 1,
        "! DeliveryBlockStatus
        delivery_block_status      TYPE c LENGTH 1,
        "! SlsOrderItemDownPaymentStatus
        sls_order_item_down_paymen TYPE c LENGTH 1,
        "! OrderRelatedBillingStatus
        order_related_billing_stat TYPE c LENGTH 1,
        "! ChmlCmplncStatus
        chml_cmplnc_status         TYPE c LENGTH 1,
        "! DangerousGoodsStatus
        dangerous_goods_status     TYPE c LENGTH 1,
        "! SafetyDataSheetStatus
        safety_data_sheet_status   TYPE c LENGTH 1,
        "! TrdCmplncEmbargoSts
        trd_cmplnc_embargo_sts     TYPE c LENGTH 1,
        "! TrdCmplncSnctndListChkSts
        trd_cmplnc_snctnd_list_chk TYPE c LENGTH 1,
        "! OvrlTrdCmplncLegalCtrlChkSts
        ovrl_trd_cmplnc_legal_ctrl TYPE c LENGTH 1,
        "! SlsDocItmOvrlSupplyBlockStatus
        sls_doc_itm_ovrl_supply_bl TYPE c LENGTH 1,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_sales_order_item_type,
      "! <p class="shorttext synchronized">List of SalesOrderItem_Type</p>
      tyt_sales_order_item_type TYPE STANDARD TABLE OF tys_sales_order_item_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrderPartner_Type</p>
      BEGIN OF tys_sales_order_partner_type,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_10,
        "! <em>Key property</em> SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! <em>Key property</em> PartnerFunction
        partner_function           TYPE c LENGTH 2,
        "! Customer
        customer                   TYPE c LENGTH 10,
        "! Supplier
        supplier                   TYPE c LENGTH 10,
        "! Personnel
        personnel                  TYPE c LENGTH 8,
        "! ContactPerson
        contact_person             TYPE c LENGTH 10,
        "! WorkAssignmentExternalID
        work_assignment_external_i TYPE c LENGTH 100,
        "! ReferenceBusinessPartner
        reference_business_partner TYPE c LENGTH 10,
        "! BusinessPartnerName1
        business_partner_name_1    TYPE c LENGTH 40,
        "! BusinessPartnerName2
        business_partner_name_2    TYPE c LENGTH 40,
        "! BusinessPartnerName3
        business_partner_name_3    TYPE c LENGTH 40,
        "! BusinessPartnerName4
        business_partner_name_4    TYPE c LENGTH 40,
        "! AddressID
        address_id                 TYPE c LENGTH 10,
        "! AddressPersonID
        address_person_id          TYPE c LENGTH 10,
        "! AddressObjectType
        address_object_type        TYPE c LENGTH 1,
        "! StreetName
        street_name                TYPE c LENGTH 60,
        "! StreetPrefixName1
        street_prefix_name_1       TYPE c LENGTH 40,
        "! StreetPrefixName2
        street_prefix_name_2       TYPE c LENGTH 40,
        "! StreetSuffixName1
        street_suffix_name_1       TYPE c LENGTH 40,
        "! StreetSuffixName2
        street_suffix_name_2       TYPE c LENGTH 40,
        "! HouseNumber
        house_number               TYPE c LENGTH 10,
        "! PostalCode
        postal_code                TYPE c LENGTH 10,
        "! CityName
        city_name                  TYPE c LENGTH 40,
        "! DistrictName
        district_name              TYPE c LENGTH 40,
        "! Region
        region                     TYPE c LENGTH 3,
        "! Country
        country                    TYPE c LENGTH 3,
        "! PhoneNumberCountry
        phone_number_country       TYPE c LENGTH 3,
        "! PhoneNumber
        phone_number               TYPE c LENGTH 30,
        "! PhoneNumberExtension
        phone_number_extension     TYPE c LENGTH 10,
        "! MobilePhoneCountry
        mobile_phone_country       TYPE c LENGTH 3,
        "! MobilePhoneNumber
        mobile_phone_number        TYPE c LENGTH 30,
        "! FaxNumberCountry
        fax_number_country         TYPE c LENGTH 3,
        "! FaxNumber
        fax_number                 TYPE c LENGTH 30,
        "! FaxNumberExtension
        fax_number_extension       TYPE c LENGTH 10,
        "! InternationalPhoneNumber
        international_phone_number TYPE c LENGTH 30,
        "! InternationalMobilePhoneNumber
        international_mobile_phone TYPE c LENGTH 30,
        "! InternationalFaxNumber
        international_fax_number   TYPE c LENGTH 30,
        "! POBox
        pobox                      TYPE c LENGTH 10,
        "! POBoxPostalCode
        pobox_postal_code          TYPE c LENGTH 10,
        "! FormOfAddress
        form_of_address            TYPE c LENGTH 4,
        "! CorrespondenceLanguage
        correspondence_language    TYPE c LENGTH 2,
        "! EmailAddress
        email_address              TYPE c LENGTH 241,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TransportZone
        transport_zone             TYPE c LENGTH 10,
        "! UnloadingPointName
        unloading_point_name       TYPE c LENGTH 25,
        "! VATRegistration
        vatregistration            TYPE c LENGTH 20,
        "! SDDocPartnerAddrIsDocSpecific
        sddoc_partner_addr_is_doc  TYPE abap_bool,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_sales_order_partner_type,
      "! <p class="shorttext synchronized">List of SalesOrderPartner_Type</p>
      tyt_sales_order_partner_type TYPE STANDARD TABLE OF tys_sales_order_partner_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrderPricingElement_Type</p>
      BEGIN OF tys_sales_order_pricing_elem_2,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_7,
        "! <em>Key property</em> SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! <em>Key property</em> PricingProcedureStep
        pricing_procedure_step     TYPE c LENGTH 3,
        "! <em>Key property</em> PricingProcedureCounter
        pricing_procedure_counter  TYPE c LENGTH 3,
        "! ConditionType
        condition_type             TYPE c LENGTH 4,
        "! PriceElementDescription
        price_element_description  TYPE c LENGTH 40,
        "! ConditionCalculationType
        condition_calculation_type TYPE c LENGTH 3,
        "! ConditionRateAmount
        condition_rate_amount      TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionCurrency
        condition_currency         TYPE c LENGTH 3,
        "! ConditionQuantity
        condition_quantity         TYPE p LENGTH 3 DECIMALS 0,
        "! ConditionBaseQuantity
        condition_base_quantity    TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionQuantitySAPUnit
        condition_quantity_sapunit TYPE c LENGTH 3,
        "! ConditionQuantityISOUnit
        condition_quantity_isounit TYPE c LENGTH 3,
        "! ConditionRateRatio
        condition_rate_ratio       TYPE p LENGTH 13 DECIMALS 9,
        "! ConditionRateRatioSAPUnit
        condition_rate_ratio_sapun TYPE c LENGTH 3,
        "! ConditionRateRatioISOUnit
        condition_rate_ratio_isoun TYPE c LENGTH 3,
        "! ConditionAmount
        condition_amount           TYPE decfloat16,
        "! ConditionBaseAmount
        condition_base_amount      TYPE p LENGTH 13 DECIMALS 9,
        "! TransactionCurrency
        transaction_currency       TYPE c LENGTH 3,
        "! CndnRoundingOffDiffAmount
        cndn_rounding_off_diff_amo TYPE decfloat16,
        "! ConditionInactiveReason
        condition_inactive_reason  TYPE c LENGTH 1,
        "! ConditionClass
        condition_class            TYPE c LENGTH 1,
        "! ConditionControl
        condition_control          TYPE c LENGTH 1,
        "! ConditionOrigin
        condition_origin           TYPE c LENGTH 1,
        "! ConditionIsForStatistics
        condition_is_for_statistic TYPE abap_bool,
        "! ConditionIsManuallyChanged
        condition_is_manually_chan TYPE abap_bool,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! VariantCondition
        variant_condition          TYPE c LENGTH 26,
        "! IsGroupCondition
        is_group_condition         TYPE abap_bool,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_sales_order_pricing_elem_2,
      "! <p class="shorttext synchronized">List of SalesOrderPricingElement_Type</p>
      tyt_sales_order_pricing_elem_2 TYPE STANDARD TABLE OF tys_sales_order_pricing_elem_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrderRelatedObject_Type</p>
      BEGIN OF tys_sales_order_related_obje_2,
        "! <em>Key property</em> SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! <em>Key property</em> SDDocRelatedObjectSequenceNmbr
        sddoc_related_object_seque TYPE c LENGTH 4,
        "! SDDocumentRelatedObjectType
        sddocument_related_object  TYPE c LENGTH 5,
        "! SDDocRelatedObjectSystem
        sddoc_related_object_syste TYPE c LENGTH 60,
        "! SDDocRelatedObjectReference1
        sddoc_related_object_refer TYPE c LENGTH 60,
        "! SDDocRelatedObjectReference2
        sddoc_related_object_ref_2 TYPE c LENGTH 60,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_sales_order_related_obje_2,
      "! <p class="shorttext synchronized">List of SalesOrderRelatedObject_Type</p>
      tyt_sales_order_related_obje_2 TYPE STANDARD TABLE OF tys_sales_order_related_obje_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrderScheduleLine_Type</p>
      BEGIN OF tys_sales_order_schedule_lin_2,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_6,
        "! <em>Key property</em> SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! <em>Key property</em> SalesOrderItem
        sales_order_item           TYPE c LENGTH 6,
        "! <em>Key property</em> ScheduleLine
        schedule_line              TYPE c LENGTH 4,
        "! ScheduleLineCategory
        schedule_line_category     TYPE c LENGTH 2,
        "! ScheduleLineOrderQuantity
        schedule_line_order_quanti TYPE p LENGTH 7 DECIMALS 3,
        "! OrderQuantitySAPUnit
        order_quantity_sapunit     TYPE c LENGTH 3,
        "! OrderQuantityISOUnit
        order_quantity_isounit     TYPE c LENGTH 3,
        "! RequestedDeliveryDate
        requested_delivery_date    TYPE datn,
        "! ConfirmedDeliveryDate
        confirmed_delivery_date    TYPE datn,
        "! ConfdOrderQtyByMatlAvailCheck
        confd_order_qty_by_matl_av TYPE p LENGTH 7 DECIMALS 3,
        "! DeliveredQtyInOrderQtyUnit
        delivered_qty_in_order_qty TYPE p LENGTH 7 DECIMALS 3,
        "! OpenConfdDelivQtyInOrdQtyUnit
        open_confd_deliv_qty_in_or TYPE p LENGTH 7 DECIMALS 3,
        "! CorrectedQtyInOrderQtyUnit
        corrected_qty_in_order_qty TYPE p LENGTH 7 DECIMALS 3,
        "! DelivBlockReasonForSchedLine
        deliv_block_reason_for_sch TYPE c LENGTH 2,
        "! PurchaseRequisition
        purchase_requisition       TYPE c LENGTH 10,
        "! PurchaseRequisitionItem
        purchase_requisition_item  TYPE c LENGTH 5,
        "! GoodsMovementType
        goods_movement_type        TYPE c LENGTH 3,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_sales_order_schedule_lin_2,
      "! <p class="shorttext synchronized">List of SalesOrderScheduleLine_Type</p>
      tyt_sales_order_schedule_lin_2 TYPE STANDARD TABLE OF tys_sales_order_schedule_lin_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrderText_Type</p>
      BEGIN OF tys_sales_order_text_type,
        "! <em>Key property</em> SalesOrder
        sales_order  TYPE c LENGTH 10,
        "! <em>Key property</em> Language
        language     TYPE c LENGTH 2,
        "! <em>Key property</em> LongTextID
        long_text_id TYPE c LENGTH 4,
        "! LongText
        long_text    TYPE string,
        "! SAP__Messages
        sap_messages TYPE tyt_sap_message,
        "! odata.etag
        etag         TYPE string,
      END OF tys_sales_order_text_type,
      "! <p class="shorttext synchronized">List of SalesOrderText_Type</p>
      tyt_sales_order_text_type TYPE STANDARD TABLE OF tys_sales_order_text_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SalesOrder_Type</p>
      BEGIN OF tys_sales_order_type,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_4,
        "! <em>Key property</em> SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! SalesOrderType
        sales_order_type_2         TYPE c LENGTH 4,
        "! SalesOrderProcessingType
        sales_order_processing_typ TYPE c LENGTH 1,
        "! SoldToParty
        sold_to_party              TYPE c LENGTH 10,
        "! SalesOrganization
        sales_organization         TYPE c LENGTH 4,
        "! DistributionChannel
        distribution_channel       TYPE c LENGTH 2,
        "! ReferenceDistributionChannel
        reference_distribution_cha TYPE c LENGTH 2,
        "! OrganizationDivision
        organization_division      TYPE c LENGTH 2,
        "! SalesOffice
        sales_office               TYPE c LENGTH 4,
        "! SalesGroup
        sales_group                TYPE c LENGTH 3,
        "! SalesDistrict
        sales_district             TYPE c LENGTH 6,
        "! CreatedByUser
        created_by_user            TYPE c LENGTH 12,
        "! CreationDate
        creation_date              TYPE datn,
        "! CreationTime
        creation_time              TYPE timn,
        "! LastChangeDateTime
        last_change_date_time      TYPE timestampl,
        "! LastChangedByUser
        last_changed_by_user       TYPE c LENGTH 12,
        "! PurchaseOrderByCustomer
        purchase_order_by_customer TYPE c LENGTH 35,
        "! PurchaseOrderByShipToParty
        purchase_order_by_ship_to  TYPE c LENGTH 35,
        "! CustomerPurchaseOrderType
        customer_purchase_order_ty TYPE c LENGTH 4,
        "! CustomerPurchaseOrderDate
        customer_purchase_order_da TYPE datn,
        "! CorrespncExternalReference
        correspnc_external_referen TYPE c LENGTH 12,
        "! CorrespncExtRefByShipToParty
        correspnc_ext_ref_by_ship  TYPE c LENGTH 12,
        "! BusinessSolutionOrder
        business_solution_order    TYPE c LENGTH 10,
        "! ReferenceSDDocument
        reference_sddocument       TYPE c LENGTH 10,
        "! ReferenceSDDocumentCategory
        reference_sddocument_categ TYPE c LENGTH 4,
        "! SDDocumentReason
        sddocument_reason          TYPE c LENGTH 3,
        "! SalesOrderDate
        sales_order_date           TYPE datn,
        "! RequestedDeliveryDate
        requested_delivery_date    TYPE datn,
        "! PricingDate
        pricing_date               TYPE datn,
        "! ServicesRenderedDate
        services_rendered_date     TYPE datn,
        "! BillingDocumentDate
        billing_document_date      TYPE datn,
        "! TotalNetAmount
        total_net_amount           TYPE decfloat16,
        "! TransactionCurrency
        transaction_currency       TYPE c LENGTH 3,
        "! DeliveryDateTypeRule
        delivery_date_type_rule    TYPE c LENGTH 1,
        "! ShippingCondition
        shipping_condition         TYPE c LENGTH 2,
        "! CompleteDeliveryIsDefined
        complete_delivery_is_defin TYPE abap_bool,
        "! SlsDocIsRlvtForProofOfDeliv
        sls_doc_is_rlvt_for_proof  TYPE abap_bool,
        "! ShippingType
        shipping_type              TYPE c LENGTH 2,
        "! ReceivingPoint
        receiving_point            TYPE c LENGTH 25,
        "! IncotermsClassification
        incoterms_classification   TYPE c LENGTH 3,
        "! IncotermsVersion
        incoterms_version          TYPE c LENGTH 4,
        "! IncotermsLocation1
        incoterms_location_1       TYPE c LENGTH 70,
        "! IncotermsLocation2
        incoterms_location_2       TYPE c LENGTH 70,
        "! SDPricingProcedure
        sdpricing_procedure        TYPE c LENGTH 6,
        "! CustomerPriceGroup
        customer_price_group       TYPE c LENGTH 2,
        "! PriceListType
        price_list_type            TYPE c LENGTH 2,
        "! FixedValueDate
        fixed_value_date           TYPE datn,
        "! TaxDepartureCountry
        tax_departure_country      TYPE c LENGTH 3,
        "! VATRegistrationCountry
        vatregistration_country    TYPE c LENGTH 3,
        "! IsEUTriangularDeal
        is_eutriangular_deal       TYPE abap_bool,
        "! CustomerPaymentTerms
        customer_payment_terms     TYPE c LENGTH 4,
        "! PaymentMethod
        payment_method             TYPE c LENGTH 1,
        "! BillingCompanyCode
        billing_company_code       TYPE c LENGTH 4,
        "! ControllingArea
        controlling_area           TYPE c LENGTH 4,
        "! CustomerAccountAssignmentGroup
        customer_account_assignmen TYPE c LENGTH 2,
        "! AssignmentReference
        assignment_reference       TYPE c LENGTH 18,
        "! AccountingDocExternalReference
        accounting_doc_external_re TYPE c LENGTH 16,
        "! CustomerCreditAccount
        customer_credit_account    TYPE c LENGTH 10,
        "! HeaderBillingBlockReason
        header_billing_block_reaso TYPE c LENGTH 2,
        "! DeliveryBlockReason
        delivery_block_reason      TYPE c LENGTH 2,
        "! SalesOrderApprovalReason
        sales_order_approval_reaso TYPE c LENGTH 4,
        "! SlsContrAutoAssgmtIDForSlsOrd
        sls_contr_auto_assgmt_idfo TYPE c LENGTH 10,
        "! CustomerGroup
        customer_group             TYPE c LENGTH 2,
        "! AdditionalCustomerGroup1
        additional_customer_group  TYPE c LENGTH 3,
        "! AdditionalCustomerGroup2
        additional_customer_grou_2 TYPE c LENGTH 3,
        "! AdditionalCustomerGroup3
        additional_customer_grou_3 TYPE c LENGTH 3,
        "! AdditionalCustomerGroup4
        additional_customer_grou_4 TYPE c LENGTH 3,
        "! AdditionalCustomerGroup5
        additional_customer_grou_5 TYPE c LENGTH 3,
        "! OverallSDProcessStatus
        overall_sdprocess_status   TYPE c LENGTH 1,
        "! OverallPurchaseConfStatus
        overall_purchase_conf_stat TYPE c LENGTH 1,
        "! OverallDeliveryBlockStatus
        overall_delivery_block_sta TYPE c LENGTH 1,
        "! OverallBillingBlockStatus
        overall_billing_block_stat TYPE c LENGTH 1,
        "! OverallDeliveryStatus
        overall_delivery_status    TYPE c LENGTH 1,
        "! TotalCreditCheckStatus
        total_credit_check_status  TYPE c LENGTH 1,
        "! OverallSDDocumentRejectionSts
        overall_sddocument_rejecti TYPE c LENGTH 1,
        "! TotalBlockStatus
        total_block_status         TYPE c LENGTH 1,
        "! HdrGeneralIncompletionStatus
        hdr_general_incompletion_s TYPE c LENGTH 1,
        "! OvrlItmGeneralIncompletionSts
        ovrl_itm_general_incomplet TYPE c LENGTH 1,
        "! OverallSDDocReferenceStatus
        overall_sddoc_reference_st TYPE c LENGTH 1,
        "! SalesDocApprovalStatus
        sales_doc_approval_status  TYPE c LENGTH 1,
        "! OverallChmlCmplncStatus
        overall_chml_cmplnc_status TYPE c LENGTH 1,
        "! OverallDangerousGoodsStatus
        overall_dangerous_goods_st TYPE c LENGTH 1,
        "! OverallSafetyDataSheetStatus
        overall_safety_data_sheet  TYPE c LENGTH 1,
        "! OverallTrdCmplncEmbargoSts
        overall_trd_cmplnc_embargo TYPE c LENGTH 1,
        "! OvrlTrdCmplncSnctndListChkSts
        ovrl_trd_cmplnc_snctnd_lis TYPE c LENGTH 1,
        "! OvrlTrdCmplncLegalCtrlChkSts
        ovrl_trd_cmplnc_legal_ctrl TYPE c LENGTH 1,
        "! SalesOrderDownPaymentStatus
        sales_order_down_payment_s TYPE c LENGTH 1,
        "! OverallOrdReltdBillgStatus
        overall_ord_reltd_billg_st TYPE c LENGTH 1,
        "! SlsDocOvrlSupplyBlockStatus
        sls_doc_ovrl_supply_block  TYPE c LENGTH 1,
        "! SAP__Messages
        sap_messages               TYPE tyt_sap_message,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_sales_order_type,
      "! <p class="shorttext synchronized">List of SalesOrder_Type</p>
      tyt_sales_order_type TYPE STANDARD TABLE OF tys_sales_order_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VariantConfigurationInstance_Type</p>
      BEGIN OF tys_variant_configuration_inst,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_11,
        "! <em>Key property</em> VarConfigurationBusObjectKey
        var_configuration_bus_obje TYPE c LENGTH 50,
        "! <em>Key property</em> VarConfigurationBusObjectType
        var_configuration_bus_ob_2 TYPE c LENGTH 30,
        "! <em>Key property</em> VarConfignInstceInternalID
        var_confign_instce_interna TYPE int4,
        "! VarConfignParInstceInternalID
        var_confign_par_instce_int TYPE int4,
        "! Product
        product                    TYPE c LENGTH 18,
        "! IdentifierBOMItem
        identifier_bomitem         TYPE c LENGTH 8,
        "! BillOfMaterialItemNumber
        bill_of_material_item_numb TYPE c LENGTH 4,
        "! VariantConfigurationQuantity
        variant_configuration_quan TYPE p LENGTH 7 DECIMALS 3,
        "! VarConfignQuantityUnit
        var_confign_quantity_unit  TYPE c LENGTH 3,
        "! VarConfignQuantityISOUnit
        var_confign_quantity_isoun TYPE c LENGTH 3,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_variant_configuration_inst,
      "! <p class="shorttext synchronized">List of VariantConfigurationInstance_Type</p>
      tyt_variant_configuration_inst TYPE STANDARD TABLE OF tys_variant_configuration_inst WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VariantConfiguration_Type</p>
      BEGIN OF tys_variant_configuration_type,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_13,
        "! <em>Key property</em> VarConfigurationBusObjectKey
        var_configuration_bus_obje TYPE c LENGTH 50,
        "! <em>Key property</em> VarConfigurationBusObjectType
        var_configuration_bus_ob_2 TYPE c LENGTH 30,
        "! VarConfignStatus
        var_confign_status         TYPE c LENGTH 1,
        "! LastChangeDateTime
        last_change_date_time      TYPE timestampl,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_variant_configuration_type,
      "! <p class="shorttext synchronized">List of VariantConfiguration_Type</p>
      tyt_variant_configuration_type TYPE STANDARD TABLE OF tys_variant_configuration_type WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VarConfignAssignedValue_Type</p>
      BEGIN OF tys_var_confign_assigned_value,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_5,
        "! <em>Key property</em> VarConfigurationBusObjectKey
        var_configuration_bus_obje TYPE c LENGTH 50,
        "! <em>Key property</em> VarConfigurationBusObjectType
        var_configuration_bus_ob_2 TYPE c LENGTH 30,
        "! <em>Key property</em> VarConfignInstceInternalID
        var_confign_instce_interna TYPE int4,
        "! <em>Key property</em> Characteristic
        characteristic             TYPE c LENGTH 30,
        "! <em>Key property</em> VariantConfigurationValueID
        variant_configuration_valu TYPE c LENGTH 150,
        "! VarCnfCharacteristicValue
        var_cnf_characteristic_val TYPE c LENGTH 70,
        "! VarCnfCharcValueDescription
        var_cnf_charc_value_descri TYPE c LENGTH 70,
        "! VarCnfCharcFromQuantity
        var_cnf_charc_from_quantit TYPE decfloat34,
        "! VarCnfCharcFromQuantityUnit
        var_cnf_charc_from_quant_2 TYPE c LENGTH 3,
        "! VarCnfCharcFromQuantityISOUnit
        var_cnf_charc_from_quant_3 TYPE c LENGTH 3,
        "! VarCnfCharcToQuantity
        var_cnf_charc_to_quantity  TYPE decfloat34,
        "! VarCnfCharcToQuantityUnit
        var_cnf_charc_to_quantit_2 TYPE c LENGTH 3,
        "! VarCnfCharcToQuantityISOUnit
        var_cnf_charc_to_quantit_3 TYPE c LENGTH 3,
        "! VarCnfCharcFromNumericValue
        var_cnf_charc_from_numeric TYPE decfloat34,
        "! VarCnfCharcToNumericValue
        var_cnf_charc_to_numeric_v TYPE decfloat34,
        "! VarCnfCharcFromDate
        var_cnf_charc_from_date    TYPE datn,
        "! VarCnfCharcFromTime
        var_cnf_charc_from_time    TYPE timn,
        "! VarCnfCharcFromAmount
        var_cnf_charc_from_amount  TYPE decfloat34,
        "! VarCnfCharcToAmount
        var_cnf_charc_to_amount    TYPE decfloat34,
        "! VarCnfCharcCurrency
        var_cnf_charc_currency     TYPE c LENGTH 3,
        "! VarConfignValueAssignmentType
        var_confign_value_assignme TYPE int4,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_var_confign_assigned_value,
      "! <p class="shorttext synchronized">List of VarConfignAssignedValue_Type</p>
      tyt_var_confign_assigned_value TYPE STANDARD TABLE OF tys_var_confign_assigned_value WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">VarConfignCharacteristic_Type</p>
      BEGIN OF tys_var_confign_characteristic,
        "! <em>Value Control Structure</em>
        value_controls             TYPE tys_value_controls_9,
        "! <em>Key property</em> VarConfigurationBusObjectKey
        var_configuration_bus_obje TYPE c LENGTH 50,
        "! <em>Key property</em> VarConfigurationBusObjectType
        var_configuration_bus_ob_2 TYPE c LENGTH 30,
        "! <em>Key property</em> VarConfignInstceInternalID
        var_confign_instce_interna TYPE int4,
        "! <em>Key property</em> Characteristic
        characteristic             TYPE c LENGTH 30,
        "! CharcDataType
        charc_data_type            TYPE c LENGTH 4,
        "! CharcTemplate
        charc_template             TYPE c LENGTH 70,
        "! Currency
        currency                   TYPE c LENGTH 3,
        "! CharcValueUnit
        charc_value_unit           TYPE c LENGTH 3,
        "! VarCnfCharcISOUnit
        var_cnf_charc_isounit      TYPE c LENGTH 3,
        "! IsReadOnly
        is_read_only               TYPE abap_bool,
        "! EntryIsRequired
        entry_is_required          TYPE abap_bool,
        "! CharcIsHidden
        charc_is_hidden            TYPE abap_bool,
        "! AdditionalValueIsAllowed
        additional_value_is_allowe TYPE abap_bool,
        "! MultipleValuesAreAllowed
        multiple_values_are_allowe TYPE abap_bool,
        "! odata.etag
        etag                       TYPE string,
      END OF tys_var_confign_characteristic,
      "! <p class="shorttext synchronized">List of VarConfignCharacteristic_Type</p>
      tyt_var_confign_characteristic TYPE STANDARD TABLE OF tys_var_confign_characteristic WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! SalesOrder
        "! <br/> Collection of type 'SalesOrder_Type'
        sales_order                TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER',
        "! SalesOrderItem
        "! <br/> Collection of type 'SalesOrderItem_Type'
        sales_order_item           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER_ITEM',
        "! SalesOrderItemPartner
        "! <br/> Collection of type 'SalesOrderItemPartner_Type'
        sales_order_item_partner   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER_ITEM_PARTNER',
        "! SalesOrderItemPricingElement
        "! <br/> Collection of type 'SalesOrderItemPricingElmnt_Type'
        sales_order_item_pricing_e TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER_ITEM_PRICING_E',
        "! SalesOrderItemRelatedObject
        "! <br/> Collection of type 'SalesOrderItemRelatedObject_Type'
        sales_order_item_related_o TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER_ITEM_RELATED_O',
        "! SalesOrderItemText
        "! <br/> Collection of type 'SalesOrderItemText_Type'
        sales_order_item_text      TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER_ITEM_TEXT',
        "! SalesOrderPartner
        "! <br/> Collection of type 'SalesOrderPartner_Type'
        sales_order_partner        TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER_PARTNER',
        "! SalesOrderPricingElement
        "! <br/> Collection of type 'SalesOrderPricingElement_Type'
        sales_order_pricing_elemen TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER_PRICING_ELEMEN',
        "! SalesOrderRelatedObject
        "! <br/> Collection of type 'SalesOrderRelatedObject_Type'
        sales_order_related_object TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER_RELATED_OBJECT',
        "! SalesOrderScheduleLine
        "! <br/> Collection of type 'SalesOrderScheduleLine_Type'
        sales_order_schedule_line  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER_SCHEDULE_LINE',
        "! SalesOrderText
        "! <br/> Collection of type 'SalesOrderText_Type'
        sales_order_text           TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SALES_ORDER_TEXT',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the bound actions</p>
      BEGIN OF gcs_bound_action,
        "! SetAssignedValues
        "! <em>bound against entity type</em> VariantConfiguration_Type
        "! <br/> See structure type {@link ..tys_parameters_1} for the parameters
        set_assigned_values TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SET_ASSIGNED_VALUES',
        "! UpdatePrices
        "! <em>bound against entity type</em> SalesOrderItem_Type
        "! <br/> See structure type {@link ..tys_parameters_2} for the parameters
        update_prices       TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'UPDATE_PRICES',
        "! UpdatePrices
        "! <em>bound against entity type</em> SalesOrder_Type
        "! <br/> See structure type {@link ..tys_parameters_3} for the parameters
        update_prices_2     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'UPDATE_PRICES_2',
      END OF gcs_bound_action.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
        "! <p class="shorttext synchronized">Internal names for D_VarCnfSetAssgdValsCharcP</p>
        "! See also structure type {@link ..tys_d_var_cnf_set_assgd_vals_c}
        BEGIN OF d_var_cnf_set_assgd_vals_c,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF d_var_cnf_set_assgd_vals_c,
        "! <p class="shorttext synchronized">Internal names for D_VarCnfSetAssgdValsInstanceP</p>
        "! See also structure type {@link ..tys_d_var_cnf_set_assgd_vals_i}
        BEGIN OF d_var_cnf_set_assgd_vals_i,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF d_var_cnf_set_assgd_vals_i,
        "! <p class="shorttext synchronized">Internal names for D_VarCnfSetAssgdValsValueP</p>
        "! See also structure type {@link ..tys_d_var_cnf_set_assgd_vals_v}
        BEGIN OF d_var_cnf_set_assgd_vals_v,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF d_var_cnf_set_assgd_vals_v,
        "! <p class="shorttext synchronized">Internal names for SAP__Message</p>
        "! See also structure type {@link ..tys_sap_message}
        BEGIN OF sap_message,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sap_message,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for SalesOrderItemPartner_Type</p>
        "! See also structure type {@link ..tys_sales_order_item_partner_t}
        BEGIN OF sales_order_item_partner_t,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _Item
            item          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'ITEM',
            "! _SalesOrder
            sales_order_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SALES_ORDER_2',
          END OF navigation,
        END OF sales_order_item_partner_t,
        "! <p class="shorttext synchronized">Internal names for SalesOrderItemPricingElmnt_Type</p>
        "! See also structure type {@link ..tys_sales_order_item_pricing_2}
        BEGIN OF sales_order_item_pricing_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _Item
            item          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'ITEM',
            "! _SalesOrder
            sales_order_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SALES_ORDER_2',
          END OF navigation,
        END OF sales_order_item_pricing_2,
        "! <p class="shorttext synchronized">Internal names for SalesOrderItemRelatedObject_Type</p>
        "! See also structure type {@link ..tys_sales_order_item_related_2}
        BEGIN OF sales_order_item_related_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _Item
            item          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'ITEM',
            "! _SalesOrder
            sales_order_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SALES_ORDER_2',
          END OF navigation,
        END OF sales_order_item_related_2,
        "! <p class="shorttext synchronized">Internal names for SalesOrderItemText_Type</p>
        "! See also structure type {@link ..tys_sales_order_item_text_type}
        BEGIN OF sales_order_item_text_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _Item
            item          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'ITEM',
            "! _SalesOrder
            sales_order_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SALES_ORDER_2',
          END OF navigation,
        END OF sales_order_item_text_type,
        "! <p class="shorttext synchronized">Internal names for SalesOrderItem_Type</p>
        "! See also structure type {@link ..tys_sales_order_item_type}
        BEGIN OF sales_order_item_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _ItemPartner
            item_partner          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'ITEM_PARTNER',
            "! _ItemPricingElement
            item_pricing_element  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'ITEM_PRICING_ELEMENT',
            "! _ItemRelatedObject
            item_related_object   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'ITEM_RELATED_OBJECT',
            "! _ItemText
            item_text             TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'ITEM_TEXT',
            "! _SalesOrder
            sales_order_2         TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SALES_ORDER_2',
            "! _ScheduleLine
            schedule_line         TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SCHEDULE_LINE',
            "! _VariantConfiguration
            variant_configuration TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'VARIANT_CONFIGURATION',
          END OF navigation,
        END OF sales_order_item_type,
        "! <p class="shorttext synchronized">Internal names for SalesOrderPartner_Type</p>
        "! See also structure type {@link ..tys_sales_order_partner_type}
        BEGIN OF sales_order_partner_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _SalesOrder
            sales_order_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SALES_ORDER_2',
          END OF navigation,
        END OF sales_order_partner_type,
        "! <p class="shorttext synchronized">Internal names for SalesOrderPricingElement_Type</p>
        "! See also structure type {@link ..tys_sales_order_pricing_elem_2}
        BEGIN OF sales_order_pricing_elem_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _SalesOrder
            sales_order_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SALES_ORDER_2',
          END OF navigation,
        END OF sales_order_pricing_elem_2,
        "! <p class="shorttext synchronized">Internal names for SalesOrderRelatedObject_Type</p>
        "! See also structure type {@link ..tys_sales_order_related_obje_2}
        BEGIN OF sales_order_related_obje_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _SalesOrder
            sales_order_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SALES_ORDER_2',
          END OF navigation,
        END OF sales_order_related_obje_2,
        "! <p class="shorttext synchronized">Internal names for SalesOrderScheduleLine_Type</p>
        "! See also structure type {@link ..tys_sales_order_schedule_lin_2}
        BEGIN OF sales_order_schedule_lin_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _Item
            item          TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'ITEM',
            "! _SalesOrder
            sales_order_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SALES_ORDER_2',
          END OF navigation,
        END OF sales_order_schedule_lin_2,
        "! <p class="shorttext synchronized">Internal names for SalesOrderText_Type</p>
        "! See also structure type {@link ..tys_sales_order_text_type}
        BEGIN OF sales_order_text_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _SalesOrder
            sales_order_2 TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'SALES_ORDER_2',
          END OF navigation,
        END OF sales_order_text_type,
        "! <p class="shorttext synchronized">Internal names for SalesOrder_Type</p>
        "! See also structure type {@link ..tys_sales_order_type}
        BEGIN OF sales_order_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _Item
            item            TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'ITEM',
            "! _Partner
            partner         TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PARTNER',
            "! _PricingElement
            pricing_element TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'PRICING_ELEMENT',
            "! _RelatedObject
            related_object  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'RELATED_OBJECT',
            "! _Text
            text            TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TEXT',
          END OF navigation,
        END OF sales_order_type,
        "! <p class="shorttext synchronized">Internal names for VariantConfigurationInstance_Type</p>
        "! See also structure type {@link ..tys_variant_configuration_inst}
        BEGIN OF variant_configuration_inst,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _Characteristic
            characteristic        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'CHARACTERISTIC',
            "! _VariantConfiguration
            variant_configuration TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'VARIANT_CONFIGURATION',
          END OF navigation,
        END OF variant_configuration_inst,
        "! <p class="shorttext synchronized">Internal names for VariantConfiguration_Type</p>
        "! See also structure type {@link ..tys_variant_configuration_type}
        BEGIN OF variant_configuration_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _Instance
            instance TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'INSTANCE',
          END OF navigation,
        END OF variant_configuration_type,
        "! <p class="shorttext synchronized">Internal names for VarConfignAssignedValue_Type</p>
        "! See also structure type {@link ..tys_var_confign_assigned_value}
        BEGIN OF var_confign_assigned_value,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _Characteristic
            characteristic_2      TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'CHARACTERISTIC_2',
            "! _VariantConfiguration
            variant_configuration TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'VARIANT_CONFIGURATION',
          END OF navigation,
        END OF var_confign_assigned_value,
        "! <p class="shorttext synchronized">Internal names for VarConfignCharacteristic_Type</p>
        "! See also structure type {@link ..tys_var_confign_characteristic}
        BEGIN OF var_confign_characteristic,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! _AssignedValue
            assigned_value        TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'ASSIGNED_VALUE',
            "! _Instance
            instance              TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'INSTANCE',
            "! _VariantConfiguration
            variant_configuration TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'VARIANT_CONFIGURATION',
          END OF navigation,
        END OF var_confign_characteristic,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define D_VarCnfSetAssgdValsCharcP</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_d_var_cnf_set_assgd_vals_c RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define D_VarCnfSetAssgdValsInstanceP</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_d_var_cnf_set_assgd_vals_i RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define D_VarCnfSetAssgdValsValueP</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_d_var_cnf_set_assgd_vals_v RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SAP__Message</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sap_message RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrderItemPartner_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_item_partner_t RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrderItemPricingElmnt_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_item_pricing_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrderItemRelatedObject_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_item_related_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrderItemText_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_item_text_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrderItem_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_item_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrderPartner_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_partner_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrderPricingElement_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_pricing_elem_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrderRelatedObject_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_related_obje_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrderScheduleLine_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_schedule_lin_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrderText_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_text_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SalesOrder_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sales_order_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VariantConfigurationInstance_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_variant_configuration_inst RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VariantConfiguration_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_variant_configuration_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VarConfignAssignedValue_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_var_confign_assigned_value RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define VarConfignCharacteristic_Type</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_var_confign_characteristic RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SetAssignedValues</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_set_assigned_values RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define UpdatePrices</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_update_prices RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define UpdatePrices</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_update_prices_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define all primitive types</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS define_primitive_types RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS ZSCM_SO_INTEGRATION IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'com.sap.gateway.srvd_a2x.api_salesorder.v0001' ) ##NO_TEXT.

    def_d_var_cnf_set_assgd_vals_c( ).
    def_d_var_cnf_set_assgd_vals_i( ).
    def_d_var_cnf_set_assgd_vals_v( ).
    def_sap_message( ).
    def_sales_order_item_partner_t( ).
    def_sales_order_item_pricing_2( ).
    def_sales_order_item_related_2( ).
    def_sales_order_item_text_type( ).
    def_sales_order_item_type( ).
    def_sales_order_partner_type( ).
    def_sales_order_pricing_elem_2( ).
    def_sales_order_related_obje_2( ).
    def_sales_order_schedule_lin_2( ).
    def_sales_order_text_type( ).
    def_sales_order_type( ).
    def_variant_configuration_inst( ).
    def_variant_configuration_type( ).
    def_var_confign_assigned_value( ).
    def_var_confign_characteristic( ).
    def_set_assigned_values( ).
    def_update_prices( ).
    def_update_prices_2( ).
    define_primitive_types( ).

  ENDMETHOD.


  METHOD define_primitive_types.

    DATA lo_primitive_type TYPE REF TO /iwbep/if_v4_pm_prim_type.


    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'PRICING_TYPE'
                            iv_element             = VALUE tys_types_for_prim_types-pricing_type( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'PRICING_TYPE_2'
                            iv_element             = VALUE tys_types_for_prim_types-pricing_type_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'VAR_CONFIGN_INSTCE_HIER_NO'
                            iv_element             = VALUE tys_types_for_prim_types-var_confign_instce_hier_no( ) ).
    lo_primitive_type->set_edm_type( 'Int32' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_d_var_cnf_set_assgd_vals_c.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'D_VAR_CNF_SET_ASSGD_VALS_C'
                                    is_structure              = VALUE tys_d_var_cnf_set_assgd_vals_c( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'D_VarCnfSetAssgdValsCharcP' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'CHARACTERISTIC' ).
    lo_primitive_property->set_edm_name( 'Characteristic' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_complex_property = lo_complex_type->create_complex_property( 'ASSIGNED_VALUE' ).
    lo_complex_property->set_edm_name( '_AssignedValue' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'D_VAR_CNF_SET_ASSGD_VALS_V' ).
    lo_complex_property->set_is_collection( ).

  ENDMETHOD.


  METHOD def_d_var_cnf_set_assgd_vals_i.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'D_VAR_CNF_SET_ASSGD_VALS_I'
                                    is_structure              = VALUE tys_d_var_cnf_set_assgd_vals_i( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'D_VarCnfSetAssgdValsInstanceP' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'VAR_CONFIGN_INSTCE_HIER_NO' ).
    lo_primitive_property->set_edm_name( 'VarConfignInstceHierNodeID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'VAR_CONFIGN_INSTCE_HIER_PA' ).
    lo_primitive_property->set_edm_name( 'VarConfignInstceHierParNodeID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'PRODUCT' ).
    lo_primitive_property->set_edm_name( 'Product' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'BILL_OF_MATERIAL_ITEM_NUMB' ).
    lo_primitive_property->set_edm_name( 'BillOfMaterialItemNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'IDENTIFIER_BOMITEM' ).
    lo_primitive_property->set_edm_name( 'IdentifierBOMItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_complex_property = lo_complex_type->create_complex_property( 'CHARACTERISTIC' ).
    lo_complex_property->set_edm_name( '_Characteristic' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'D_VAR_CNF_SET_ASSGD_VALS_C' ).
    lo_complex_property->set_is_collection( ).

  ENDMETHOD.


  METHOD def_d_var_cnf_set_assgd_vals_v.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'D_VAR_CNF_SET_ASSGD_VALS_V'
                                    is_structure              = VALUE tys_d_var_cnf_set_assgd_vals_v( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'D_VarCnfSetAssgdValsValueP' ) ##NO_TEXT.
    lo_complex_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_primitive_property = lo_complex_type->get_primitive_property( 'VAR_CNF_CHARACTERISTIC_VAL' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharacteristicValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'VAR_CNF_CHARC_FROM_QUANTIT' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcFromQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_floating( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'VAR_CNF_CHARC_FROM_NUMERIC' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcFromNumericValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_floating( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'VAR_CNF_CHARC_FROM_DATE' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcFromDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'VAR_CNF_CHARC_FROM_TIME' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcFromTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'VAR_CNF_CHARC_FROM_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcFromAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_floating( ).

  ENDMETHOD.


  METHOD def_sales_order_item_partner_t.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER_ITEM_PARTNER_T'
                                    is_structure              = VALUE tys_sales_order_item_partner_t( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrderItemPartner_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER_ITEM_PARTNER' ).
    lo_entity_set->set_edm_name( 'SalesOrderItemPartner' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_FUNCTION' ).
    lo_primitive_property->set_edm_name( 'PartnerFunction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'Customer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'Supplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSONNEL' ).
    lo_primitive_property->set_edm_name( 'Personnel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTACT_PERSON' ).
    lo_primitive_property->set_edm_name( 'ContactPerson' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WORK_ASSIGNMENT_EXTERNAL_I' ).
    lo_primitive_property->set_edm_name( 'WorkAssignmentExternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 100 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_BUSINESS_PARTNER' ).
    lo_primitive_property->set_edm_name( 'ReferenceBusinessPartner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER_NAME_1' ).
    lo_primitive_property->set_edm_name( 'BusinessPartnerName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER_NAME_2' ).
    lo_primitive_property->set_edm_name( 'BusinessPartnerName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER_NAME_3' ).
    lo_primitive_property->set_edm_name( 'BusinessPartnerName3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER_NAME_4' ).
    lo_primitive_property->set_edm_name( 'BusinessPartnerName4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'AddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_PERSON_ID' ).
    lo_primitive_property->set_edm_name( 'AddressPersonID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_OBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'AddressObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_NAME' ).
    lo_primitive_property->set_edm_name( 'StreetName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_PREFIX_NAME_1' ).
    lo_primitive_property->set_edm_name( 'StreetPrefixName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_PREFIX_NAME_2' ).
    lo_primitive_property->set_edm_name( 'StreetPrefixName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_SUFFIX_NAME_1' ).
    lo_primitive_property->set_edm_name( 'StreetSuffixName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_SUFFIX_NAME_2' ).
    lo_primitive_property->set_edm_name( 'StreetSuffixName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'HouseNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'PostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_NAME' ).
    lo_primitive_property->set_edm_name( 'CityName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTRICT_NAME' ).
    lo_primitive_property->set_edm_name( 'DistrictName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGION' ).
    lo_primitive_property->set_edm_name( 'Region' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PHONE_NUMBER_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'PhoneNumberCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PHONE_NUMBER_EXTENSION' ).
    lo_primitive_property->set_edm_name( 'PhoneNumberExtension' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MOBILE_PHONE_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'MobilePhoneCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MOBILE_PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'MobilePhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NUMBER_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'FaxNumberCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'FaxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NUMBER_EXTENSION' ).
    lo_primitive_property->set_edm_name( 'FaxNumberExtension' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTERNATIONAL_PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'InternationalPhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTERNATIONAL_MOBILE_PHONE' ).
    lo_primitive_property->set_edm_name( 'InternationalMobilePhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTERNATIONAL_FAX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'InternationalFaxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX' ).
    lo_primitive_property->set_edm_name( 'POBox' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'POBoxPostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FORM_OF_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'FormOfAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPONDENCE_LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'CorrespondenceLanguage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMAIL_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'EmailAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 241 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSPORT_ZONE' ).
    lo_primitive_property->set_edm_name( 'TransportZone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNLOADING_POINT_NAME' ).
    lo_primitive_property->set_edm_name( 'UnloadingPointName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VATREGISTRATION' ).
    lo_primitive_property->set_edm_name( 'VATRegistration' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_IS_SPECIFIC_FOR_SD' ).
    lo_primitive_property->set_edm_name( 'PartnerIsSpecificForSDDocItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOC_PARTNER_ADDR_IS_DOC' ).
    lo_primitive_property->set_edm_name( 'SDDocPartnerAddrIsDocSpecific' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'ITEM' ).
    lo_navigation_property->set_edm_name( '_Item' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SALES_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_SalesOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_sales_order_item_pricing_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER_ITEM_PRICING_2'
                                    is_structure              = VALUE tys_sales_order_item_pricing_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrderItemPricingElmnt_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER_ITEM_PRICING_E' ).
    lo_entity_set->set_edm_name( 'SalesOrderItemPricingElement' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_PROCEDURE_STEP' ).
    lo_primitive_property->set_edm_name( 'PricingProcedureStep' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_PROCEDURE_COUNTER' ).
    lo_primitive_property->set_edm_name( 'PricingProcedureCounter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_ELEMENT_DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'PriceElementDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CALCULATION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionCalculationType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'ConditionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_BASE_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'ConditionBaseQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY_SAPUNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantitySAPUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY_ISOUNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantityISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO_SAPUN' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatioSAPUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO_ISOUN' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatioISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_BASE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionBaseAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSACTION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'TransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNDN_ROUNDING_OFF_DIFF_AMO' ).
    lo_primitive_property->set_edm_name( 'CndnRoundingOffDiffAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_INACTIVE_REASON' ).
    lo_primitive_property->set_edm_name( 'ConditionInactiveReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CLASS' ).
    lo_primitive_property->set_edm_name( 'ConditionClass' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CONTROL' ).
    lo_primitive_property->set_edm_name( 'ConditionControl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'ConditionOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_FOR_STATISTIC' ).
    lo_primitive_property->set_edm_name( 'ConditionIsForStatistics' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_MANUALLY_CHAN' ).
    lo_primitive_property->set_edm_name( 'ConditionIsManuallyChanged' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VARIANT_CONDITION' ).
    lo_primitive_property->set_edm_name( 'VariantCondition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 26 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_GROUP_CONDITION' ).
    lo_primitive_property->set_edm_name( 'IsGroupCondition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'ITEM' ).
    lo_navigation_property->set_edm_name( '_Item' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SALES_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_SalesOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_sales_order_item_related_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER_ITEM_RELATED_2'
                                    is_structure              = VALUE tys_sales_order_item_related_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrderItemRelatedObject_Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER_ITEM_RELATED_O' ).
    lo_entity_set->set_edm_name( 'SalesOrderItemRelatedObject' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOC_RELATED_OBJECT_SEQUE' ).
    lo_primitive_property->set_edm_name( 'SDDocRelatedObjectSequenceNmbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOCUMENT_RELATED_OBJECT' ).
    lo_primitive_property->set_edm_name( 'SDDocumentRelatedObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOC_RELATED_OBJECT_SYSTE' ).
    lo_primitive_property->set_edm_name( 'SDDocRelatedObjectSystem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOC_RELATED_OBJECT_REFER' ).
    lo_primitive_property->set_edm_name( 'SDDocRelatedObjectReference1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOC_RELATED_OBJECT_REF_2' ).
    lo_primitive_property->set_edm_name( 'SDDocRelatedObjectReference2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'ITEM' ).
    lo_navigation_property->set_edm_name( '_Item' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SALES_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_SalesOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_sales_order_item_text_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER_ITEM_TEXT_TYPE'
                                    is_structure              = VALUE tys_sales_order_item_text_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrderItemText_Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER_ITEM_TEXT' ).
    lo_entity_set->set_edm_name( 'SalesOrderItemText' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Language' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LONG_TEXT_ID' ).
    lo_primitive_property->set_edm_name( 'LongTextID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LONG_TEXT' ).
    lo_primitive_property->set_edm_name( 'LongText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'ITEM' ).
    lo_navigation_property->set_edm_name( '_Item' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SALES_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_SalesOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_sales_order_item_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER_ITEM_TYPE'
                                    is_structure              = VALUE tys_sales_order_item_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrderItem_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER_ITEM' ).
    lo_entity_set->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HIGHER_LEVEL_ITEM' ).
    lo_primitive_property->set_edm_name( 'HigherLevelItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItemCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT' ).
    lo_primitive_property->set_edm_name( 'Product' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORIGINALLY_REQUESTED_MATER' ).
    lo_primitive_property->set_edm_name( 'OriginallyRequestedMaterial' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_GROUP' ).
    lo_primitive_property->set_edm_name( 'ProductGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_BY_CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'MaterialByCustomer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTERNATIONAL_ARTICLE_NUMB' ).
    lo_primitive_property->set_edm_name( 'InternationalArticleNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_BY_CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderByCustomer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNDERLYING_PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'UnderlyingPurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPNC_EXTERNAL_REFEREN' ).
    lo_primitive_property->set_edm_name( 'CorrespncExternalReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_BY_SHIP_TO' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderByShipToParty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNDRLG_PUR_ORD_ITM_BY_SHIP' ).
    lo_primitive_property->set_edm_name( 'UndrlgPurOrdItmByShipToParty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPNC_EXT_REF_BY_SHIP' ).
    lo_primitive_property->set_edm_name( 'CorrespncExtRefByShipToParty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONFD_DELIV_QTY_IN_ORDER_Q' ).
    lo_primitive_property->set_edm_name( 'ConfdDelivQtyInOrderQtyUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_QUANTITY_SAPUNIT' ).
    lo_primitive_property->set_edm_name( 'OrderQuantitySAPUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_QUANTITY_ISOUNIT' ).
    lo_primitive_property->set_edm_name( 'OrderQuantityISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUESTED_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'RequestedQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUESTED_QUANTITY_SAPUNIT' ).
    lo_primitive_property->set_edm_name( 'RequestedQuantitySAPUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUESTED_QUANTITY_ISOUNIT' ).
    lo_primitive_property->set_edm_name( 'RequestedQuantityISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_SDDOCUMENT' ).
    lo_primitive_property->set_edm_name( 'ReferenceSDDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_SDDOCUMENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'ReferenceSDDocumentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_SDDOCUMENT_CATEG' ).
    lo_primitive_property->set_edm_name( 'ReferenceSDDocumentCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_SOLUTION_ORDER_IT' ).
    lo_primitive_property->set_edm_name( 'BusinessSolutionOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUS_SOLN_ORD_ITEM_BUNDLE_I' ).
    lo_primitive_property->set_edm_name( 'BusSolnOrdItemBundleItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_GROSS_WEIGHT' ).
    lo_primitive_property->set_edm_name( 'ItemGrossWeight' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_NET_WEIGHT' ).
    lo_primitive_property->set_edm_name( 'ItemNetWeight' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_WEIGHT_SAPUNIT' ).
    lo_primitive_property->set_edm_name( 'ItemWeightSAPUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_WEIGHT_ISOUNIT' ).
    lo_primitive_property->set_edm_name( 'ItemWeightISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_VOLUME' ).
    lo_primitive_property->set_edm_name( 'ItemVolume' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_VOLUME_SAPUNIT' ).
    lo_primitive_property->set_edm_name( 'ItemVolumeSAPUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_VOLUME_ISOUNIT' ).
    lo_primitive_property->set_edm_name( 'ItemVolumeISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUESTED_DELIVERY_DATE' ).
    lo_primitive_property->set_edm_name( 'RequestedDeliveryDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONFIRMED_DELIVERY_DATE' ).
    lo_primitive_property->set_edm_name( 'ConfirmedDeliveryDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_DATE' ).
    lo_primitive_property->set_edm_name( 'PricingDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICES_RENDERED_DATE' ).
    lo_primitive_property->set_edm_name( 'ServicesRenderedDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILLING_DOCUMENT_DATE' ).
    lo_primitive_property->set_edm_name( 'BillingDocumentDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'NetAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSACTION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'TransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'TaxAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_1_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'Subtotal1Amount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_2_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'Subtotal2Amount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_3_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'Subtotal3Amount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_4_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'Subtotal4Amount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_5_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'Subtotal5Amount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUBTOTAL_6_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'Subtotal6Amount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_GROUP' ).
    lo_primitive_property->set_edm_name( 'CustomerGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BATCH' ).
    lo_primitive_property->set_edm_name( 'Batch' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STORAGE_LOCATION' ).
    lo_primitive_property->set_edm_name( 'StorageLocation' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPPING_POINT' ).
    lo_primitive_property->set_edm_name( 'ShippingPoint' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPPING_TYPE' ).
    lo_primitive_property->set_edm_name( 'ShippingType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ROUTE' ).
    lo_primitive_property->set_edm_name( 'Route' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_PRIORITY' ).
    lo_primitive_property->set_edm_name( 'DeliveryPriority' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTIAL_DELIVERY_IS_ALLOWE' ).
    lo_primitive_property->set_edm_name( 'PartialDeliveryIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MAX_NMBR_OF_PARTIAL_DELIVE' ).
    lo_primitive_property->set_edm_name( 'MaxNmbrOfPartialDelivery' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_DATE_TYPE_RULE' ).
    lo_primitive_property->set_edm_name( 'DeliveryDateTypeRule' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECEIVING_POINT' ).
    lo_primitive_property->set_edm_name( 'ReceivingPoint' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_GROUP' ).
    lo_primitive_property->set_edm_name( 'DeliveryGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_CLASSIFICATION' ).
    lo_primitive_property->set_edm_name( 'IncotermsClassification' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_1' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_2' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_VERSION' ).
    lo_primitive_property->set_edm_name( 'IncotermsVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_PAYMENT_TERMS' ).
    lo_primitive_property->set_edm_name( 'CustomerPaymentTerms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXED_VALUE_DATE' ).
    lo_primitive_property->set_edm_name( 'FixedValueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_PRICE_GROUP' ).
    lo_primitive_property->set_edm_name( 'CustomerPriceGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL_PRICING_GROUP' ).
    lo_primitive_property->set_edm_name( 'MaterialPricingGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusinessArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CENTER' ).
    lo_primitive_property->set_edm_name( 'ProfitCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATL_ACCOUNT_ASSIGNMENT_GR' ).
    lo_primitive_property->set_edm_name( 'MatlAccountAssignmentGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBSELEMENT_EXTERNAL_ID' ).
    lo_primitive_property->set_edm_name( 'WBSElementExternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_BILLING_BLOCK_REASON' ).
    lo_primitive_property->set_edm_name( 'ItemBillingBlockReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_DOCUMENT_RJCN_REASON' ).
    lo_primitive_property->set_edm_name( 'SalesDocumentRjcnReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_DOC_ITEM_SUPPLY_BLOC' ).
    lo_primitive_property->set_edm_name( 'SalesDocItemSupplyBlockReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_CONFIGURATION' ).
    lo_primitive_property->set_edm_name( 'ProductConfiguration' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SLS_CONTR_AUTO_ASSGMT_IDFO' ).
    lo_primitive_property->set_edm_name( 'SlsContrAutoAssgmtIDForSlsOrd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDPROCESS_STATUS' ).
    lo_primitive_property->set_edm_name( 'SDProcessStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_CONFIRMATION_STAT' ).
    lo_primitive_property->set_edm_name( 'PurchaseConfirmationStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOCUMENT_REJECTION_STATU' ).
    lo_primitive_property->set_edm_name( 'SDDocumentRejectionStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_STATUS' ).
    lo_primitive_property->set_edm_name( 'DeliveryStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILLING_BLOCK_STATUS' ).
    lo_primitive_property->set_edm_name( 'BillingBlockStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ITEM_GENERAL_INCOMPLETION' ).
    lo_primitive_property->set_edm_name( 'ItemGeneralIncompletionStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_BLOCK_STATUS' ).
    lo_primitive_property->set_edm_name( 'DeliveryBlockStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SLS_ORDER_ITEM_DOWN_PAYMEN' ).
    lo_primitive_property->set_edm_name( 'SlsOrderItemDownPaymentStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_RELATED_BILLING_STAT' ).
    lo_primitive_property->set_edm_name( 'OrderRelatedBillingStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHML_CMPLNC_STATUS' ).
    lo_primitive_property->set_edm_name( 'ChmlCmplncStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DANGEROUS_GOODS_STATUS' ).
    lo_primitive_property->set_edm_name( 'DangerousGoodsStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SAFETY_DATA_SHEET_STATUS' ).
    lo_primitive_property->set_edm_name( 'SafetyDataSheetStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRD_CMPLNC_EMBARGO_STS' ).
    lo_primitive_property->set_edm_name( 'TrdCmplncEmbargoSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRD_CMPLNC_SNCTND_LIST_CHK' ).
    lo_primitive_property->set_edm_name( 'TrdCmplncSnctndListChkSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVRL_TRD_CMPLNC_LEGAL_CTRL' ).
    lo_primitive_property->set_edm_name( 'OvrlTrdCmplncLegalCtrlChkSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SLS_DOC_ITM_OVRL_SUPPLY_BL' ).
    lo_primitive_property->set_edm_name( 'SlsDocItmOvrlSupplyBlockStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'ITEM_PARTNER' ).
    lo_navigation_property->set_edm_name( '_ItemPartner' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_ITEM_PARTNER_T' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'ITEM_PRICING_ELEMENT' ).
    lo_navigation_property->set_edm_name( '_ItemPricingElement' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_ITEM_PRICING_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'ITEM_RELATED_OBJECT' ).
    lo_navigation_property->set_edm_name( '_ItemRelatedObject' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_ITEM_RELATED_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'ITEM_TEXT' ).
    lo_navigation_property->set_edm_name( '_ItemText' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_ITEM_TEXT_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SALES_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_SalesOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SCHEDULE_LINE' ).
    lo_navigation_property->set_edm_name( '_ScheduleLine' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_SCHEDULE_LIN_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'VARIANT_CONFIGURATION' ).
    lo_navigation_property->set_edm_name( '_VariantConfiguration' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'VARIANT_CONFIGURATION_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one_optional ).
    lo_navigation_property->create_vcs_value_control( ).

  ENDMETHOD.


  METHOD def_sales_order_partner_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER_PARTNER_TYPE'
                                    is_structure              = VALUE tys_sales_order_partner_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrderPartner_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER_PARTNER' ).
    lo_entity_set->set_edm_name( 'SalesOrderPartner' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_FUNCTION' ).
    lo_primitive_property->set_edm_name( 'PartnerFunction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'Customer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'Supplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSONNEL' ).
    lo_primitive_property->set_edm_name( 'Personnel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTACT_PERSON' ).
    lo_primitive_property->set_edm_name( 'ContactPerson' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WORK_ASSIGNMENT_EXTERNAL_I' ).
    lo_primitive_property->set_edm_name( 'WorkAssignmentExternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 100 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_BUSINESS_PARTNER' ).
    lo_primitive_property->set_edm_name( 'ReferenceBusinessPartner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER_NAME_1' ).
    lo_primitive_property->set_edm_name( 'BusinessPartnerName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER_NAME_2' ).
    lo_primitive_property->set_edm_name( 'BusinessPartnerName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER_NAME_3' ).
    lo_primitive_property->set_edm_name( 'BusinessPartnerName3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER_NAME_4' ).
    lo_primitive_property->set_edm_name( 'BusinessPartnerName4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_ID' ).
    lo_primitive_property->set_edm_name( 'AddressID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_PERSON_ID' ).
    lo_primitive_property->set_edm_name( 'AddressPersonID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDRESS_OBJECT_TYPE' ).
    lo_primitive_property->set_edm_name( 'AddressObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_NAME' ).
    lo_primitive_property->set_edm_name( 'StreetName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_PREFIX_NAME_1' ).
    lo_primitive_property->set_edm_name( 'StreetPrefixName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_PREFIX_NAME_2' ).
    lo_primitive_property->set_edm_name( 'StreetPrefixName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_SUFFIX_NAME_1' ).
    lo_primitive_property->set_edm_name( 'StreetSuffixName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_SUFFIX_NAME_2' ).
    lo_primitive_property->set_edm_name( 'StreetSuffixName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'HouseNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'PostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_NAME' ).
    lo_primitive_property->set_edm_name( 'CityName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTRICT_NAME' ).
    lo_primitive_property->set_edm_name( 'DistrictName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGION' ).
    lo_primitive_property->set_edm_name( 'Region' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PHONE_NUMBER_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'PhoneNumberCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PHONE_NUMBER_EXTENSION' ).
    lo_primitive_property->set_edm_name( 'PhoneNumberExtension' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MOBILE_PHONE_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'MobilePhoneCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MOBILE_PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'MobilePhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NUMBER_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'FaxNumberCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'FaxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NUMBER_EXTENSION' ).
    lo_primitive_property->set_edm_name( 'FaxNumberExtension' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTERNATIONAL_PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'InternationalPhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTERNATIONAL_MOBILE_PHONE' ).
    lo_primitive_property->set_edm_name( 'InternationalMobilePhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTERNATIONAL_FAX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'InternationalFaxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX' ).
    lo_primitive_property->set_edm_name( 'POBox' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'POBoxPostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FORM_OF_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'FormOfAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPONDENCE_LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'CorrespondenceLanguage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMAIL_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'EmailAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 241 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSPORT_ZONE' ).
    lo_primitive_property->set_edm_name( 'TransportZone' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNLOADING_POINT_NAME' ).
    lo_primitive_property->set_edm_name( 'UnloadingPointName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VATREGISTRATION' ).
    lo_primitive_property->set_edm_name( 'VATRegistration' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOC_PARTNER_ADDR_IS_DOC' ).
    lo_primitive_property->set_edm_name( 'SDDocPartnerAddrIsDocSpecific' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SALES_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_SalesOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_sales_order_pricing_elem_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER_PRICING_ELEM_2'
                                    is_structure              = VALUE tys_sales_order_pricing_elem_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrderPricingElement_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER_PRICING_ELEMEN' ).
    lo_entity_set->set_edm_name( 'SalesOrderPricingElement' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_PROCEDURE_STEP' ).
    lo_primitive_property->set_edm_name( 'PricingProcedureStep' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_PROCEDURE_COUNTER' ).
    lo_primitive_property->set_edm_name( 'PricingProcedureCounter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_ELEMENT_DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'PriceElementDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CALCULATION_TYPE' ).
    lo_primitive_property->set_edm_name( 'ConditionCalculationType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionRateAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'ConditionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_BASE_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'ConditionBaseQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY_SAPUNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantitySAPUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_QUANTITY_ISOUNIT' ).
    lo_primitive_property->set_edm_name( 'ConditionQuantityISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatio' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO_SAPUN' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatioSAPUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_RATE_RATIO_ISOUN' ).
    lo_primitive_property->set_edm_name( 'ConditionRateRatioISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_BASE_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'ConditionBaseAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSACTION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'TransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CNDN_ROUNDING_OFF_DIFF_AMO' ).
    lo_primitive_property->set_edm_name( 'CndnRoundingOffDiffAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_INACTIVE_REASON' ).
    lo_primitive_property->set_edm_name( 'ConditionInactiveReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CLASS' ).
    lo_primitive_property->set_edm_name( 'ConditionClass' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_CONTROL' ).
    lo_primitive_property->set_edm_name( 'ConditionControl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'ConditionOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_FOR_STATISTIC' ).
    lo_primitive_property->set_edm_name( 'ConditionIsForStatistics' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONDITION_IS_MANUALLY_CHAN' ).
    lo_primitive_property->set_edm_name( 'ConditionIsManuallyChanged' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VARIANT_CONDITION' ).
    lo_primitive_property->set_edm_name( 'VariantCondition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 26 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_GROUP_CONDITION' ).
    lo_primitive_property->set_edm_name( 'IsGroupCondition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SALES_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_SalesOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_sales_order_related_obje_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER_RELATED_OBJE_2'
                                    is_structure              = VALUE tys_sales_order_related_obje_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrderRelatedObject_Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER_RELATED_OBJECT' ).
    lo_entity_set->set_edm_name( 'SalesOrderRelatedObject' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOC_RELATED_OBJECT_SEQUE' ).
    lo_primitive_property->set_edm_name( 'SDDocRelatedObjectSequenceNmbr' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOCUMENT_RELATED_OBJECT' ).
    lo_primitive_property->set_edm_name( 'SDDocumentRelatedObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOC_RELATED_OBJECT_SYSTE' ).
    lo_primitive_property->set_edm_name( 'SDDocRelatedObjectSystem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOC_RELATED_OBJECT_REFER' ).
    lo_primitive_property->set_edm_name( 'SDDocRelatedObjectReference1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOC_RELATED_OBJECT_REF_2' ).
    lo_primitive_property->set_edm_name( 'SDDocRelatedObjectReference2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SALES_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_SalesOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_sales_order_schedule_lin_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER_SCHEDULE_LIN_2'
                                    is_structure              = VALUE tys_sales_order_schedule_lin_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrderScheduleLine_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER_SCHEDULE_LINE' ).
    lo_entity_set->set_edm_name( 'SalesOrderScheduleLine' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE' ).
    lo_primitive_property->set_edm_name( 'ScheduleLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE_CATEGORY' ).
    lo_primitive_property->set_edm_name( 'ScheduleLineCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SCHEDULE_LINE_ORDER_QUANTI' ).
    lo_primitive_property->set_edm_name( 'ScheduleLineOrderQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_QUANTITY_SAPUNIT' ).
    lo_primitive_property->set_edm_name( 'OrderQuantitySAPUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDER_QUANTITY_ISOUNIT' ).
    lo_primitive_property->set_edm_name( 'OrderQuantityISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUESTED_DELIVERY_DATE' ).
    lo_primitive_property->set_edm_name( 'RequestedDeliveryDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONFIRMED_DELIVERY_DATE' ).
    lo_primitive_property->set_edm_name( 'ConfirmedDeliveryDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONFD_ORDER_QTY_BY_MATL_AV' ).
    lo_primitive_property->set_edm_name( 'ConfdOrderQtyByMatlAvailCheck' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERED_QTY_IN_ORDER_QTY' ).
    lo_primitive_property->set_edm_name( 'DeliveredQtyInOrderQtyUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OPEN_CONFD_DELIV_QTY_IN_OR' ).
    lo_primitive_property->set_edm_name( 'OpenConfdDelivQtyInOrdQtyUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRECTED_QTY_IN_ORDER_QTY' ).
    lo_primitive_property->set_edm_name( 'CorrectedQtyInOrderQtyUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIV_BLOCK_REASON_FOR_SCH' ).
    lo_primitive_property->set_edm_name( 'DelivBlockReasonForSchedLine' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_REQUISITION' ).
    lo_primitive_property->set_edm_name( 'PurchaseRequisition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_REQUISITION_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseRequisitionItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GOODS_MOVEMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'GoodsMovementType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'ITEM' ).
    lo_navigation_property->set_edm_name( '_Item' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SALES_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_SalesOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_sales_order_text_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER_TEXT_TYPE'
                                    is_structure              = VALUE tys_sales_order_text_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrderText_Type' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER_TEXT' ).
    lo_entity_set->set_edm_name( 'SalesOrderText' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Language' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LONG_TEXT_ID' ).
    lo_primitive_property->set_edm_name( 'LongTextID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LONG_TEXT' ).
    lo_primitive_property->set_edm_name( 'LongText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'SALES_ORDER_2' ).
    lo_navigation_property->set_edm_name( '_SalesOrder' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_sales_order_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SALES_ORDER_TYPE'
                                    is_structure              = VALUE tys_sales_order_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SalesOrder_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'SALES_ORDER' ).
    lo_entity_set->set_edm_name( 'SalesOrder' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_TYPE_2' ).
    lo_primitive_property->set_edm_name( 'SalesOrderType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_PROCESSING_TYP' ).
    lo_primitive_property->set_edm_name( 'SalesOrderProcessingType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SOLD_TO_PARTY' ).
    lo_primitive_property->set_edm_name( 'SoldToParty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORGANIZATION' ).
    lo_primitive_property->set_edm_name( 'SalesOrganization' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DISTRIBUTION_CHANNEL' ).
    lo_primitive_property->set_edm_name( 'DistributionChannel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_DISTRIBUTION_CHA' ).
    lo_primitive_property->set_edm_name( 'ReferenceDistributionChannel' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORGANIZATION_DIVISION' ).
    lo_primitive_property->set_edm_name( 'OrganizationDivision' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_OFFICE' ).
    lo_primitive_property->set_edm_name( 'SalesOffice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_GROUP' ).
    lo_primitive_property->set_edm_name( 'SalesGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_DISTRICT' ).
    lo_primitive_property->set_edm_name( 'SalesDistrict' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY_USER' ).
    lo_primitive_property->set_edm_name( 'CreatedByUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_DATE' ).
    lo_primitive_property->set_edm_name( 'CreationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_TIME' ).
    lo_primitive_property->set_edm_name( 'CreationTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGE_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'LastChangeDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGED_BY_USER' ).
    lo_primitive_property->set_edm_name( 'LastChangedByUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_BY_CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderByCustomer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_BY_SHIP_TO' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderByShipToParty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_PURCHASE_ORDER_TY' ).
    lo_primitive_property->set_edm_name( 'CustomerPurchaseOrderType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_PURCHASE_ORDER_DA' ).
    lo_primitive_property->set_edm_name( 'CustomerPurchaseOrderDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPNC_EXTERNAL_REFEREN' ).
    lo_primitive_property->set_edm_name( 'CorrespncExternalReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CORRESPNC_EXT_REF_BY_SHIP' ).
    lo_primitive_property->set_edm_name( 'CorrespncExtRefByShipToParty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_SOLUTION_ORDER' ).
    lo_primitive_property->set_edm_name( 'BusinessSolutionOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_SDDOCUMENT' ).
    lo_primitive_property->set_edm_name( 'ReferenceSDDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_SDDOCUMENT_CATEG' ).
    lo_primitive_property->set_edm_name( 'ReferenceSDDocumentCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDDOCUMENT_REASON' ).
    lo_primitive_property->set_edm_name( 'SDDocumentReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_DATE' ).
    lo_primitive_property->set_edm_name( 'SalesOrderDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REQUESTED_DELIVERY_DATE' ).
    lo_primitive_property->set_edm_name( 'RequestedDeliveryDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICING_DATE' ).
    lo_primitive_property->set_edm_name( 'PricingDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICES_RENDERED_DATE' ).
    lo_primitive_property->set_edm_name( 'ServicesRenderedDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILLING_DOCUMENT_DATE' ).
    lo_primitive_property->set_edm_name( 'BillingDocumentDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_NET_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'TotalNetAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_variable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSACTION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'TransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_DATE_TYPE_RULE' ).
    lo_primitive_property->set_edm_name( 'DeliveryDateTypeRule' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPPING_CONDITION' ).
    lo_primitive_property->set_edm_name( 'ShippingCondition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPLETE_DELIVERY_IS_DEFIN' ).
    lo_primitive_property->set_edm_name( 'CompleteDeliveryIsDefined' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SLS_DOC_IS_RLVT_FOR_PROOF' ).
    lo_primitive_property->set_edm_name( 'SlsDocIsRlvtForProofOfDeliv' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SHIPPING_TYPE' ).
    lo_primitive_property->set_edm_name( 'ShippingType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECEIVING_POINT' ).
    lo_primitive_property->set_edm_name( 'ReceivingPoint' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_CLASSIFICATION' ).
    lo_primitive_property->set_edm_name( 'IncotermsClassification' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_VERSION' ).
    lo_primitive_property->set_edm_name( 'IncotermsVersion' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_1' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INCOTERMS_LOCATION_2' ).
    lo_primitive_property->set_edm_name( 'IncotermsLocation2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SDPRICING_PROCEDURE' ).
    lo_primitive_property->set_edm_name( 'SDPricingProcedure' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_PRICE_GROUP' ).
    lo_primitive_property->set_edm_name( 'CustomerPriceGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRICE_LIST_TYPE' ).
    lo_primitive_property->set_edm_name( 'PriceListType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXED_VALUE_DATE' ).
    lo_primitive_property->set_edm_name( 'FixedValueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DEPARTURE_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxDepartureCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VATREGISTRATION_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'VATRegistrationCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_EUTRIANGULAR_DEAL' ).
    lo_primitive_property->set_edm_name( 'IsEUTriangularDeal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_PAYMENT_TERMS' ).
    lo_primitive_property->set_edm_name( 'CustomerPaymentTerms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_METHOD' ).
    lo_primitive_property->set_edm_name( 'PaymentMethod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILLING_COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'BillingCompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTROLLING_AREA' ).
    lo_primitive_property->set_edm_name( 'ControllingArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_ACCOUNT_ASSIGNMEN' ).
    lo_primitive_property->set_edm_name( 'CustomerAccountAssignmentGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ASSIGNMENT_REFERENCE' ).
    lo_primitive_property->set_edm_name( 'AssignmentReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNTING_DOC_EXTERNAL_RE' ).
    lo_primitive_property->set_edm_name( 'AccountingDocExternalReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_CREDIT_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'CustomerCreditAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HEADER_BILLING_BLOCK_REASO' ).
    lo_primitive_property->set_edm_name( 'HeaderBillingBlockReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_BLOCK_REASON' ).
    lo_primitive_property->set_edm_name( 'DeliveryBlockReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_APPROVAL_REASO' ).
    lo_primitive_property->set_edm_name( 'SalesOrderApprovalReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SLS_CONTR_AUTO_ASSGMT_IDFO' ).
    lo_primitive_property->set_edm_name( 'SlsContrAutoAssgmtIDForSlsOrd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER_GROUP' ).
    lo_primitive_property->set_edm_name( 'CustomerGroup' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDITIONAL_CUSTOMER_GROUP' ).
    lo_primitive_property->set_edm_name( 'AdditionalCustomerGroup1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDITIONAL_CUSTOMER_GROU_2' ).
    lo_primitive_property->set_edm_name( 'AdditionalCustomerGroup2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDITIONAL_CUSTOMER_GROU_3' ).
    lo_primitive_property->set_edm_name( 'AdditionalCustomerGroup3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDITIONAL_CUSTOMER_GROU_4' ).
    lo_primitive_property->set_edm_name( 'AdditionalCustomerGroup4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDITIONAL_CUSTOMER_GROU_5' ).
    lo_primitive_property->set_edm_name( 'AdditionalCustomerGroup5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_SDPROCESS_STATUS' ).
    lo_primitive_property->set_edm_name( 'OverallSDProcessStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_PURCHASE_CONF_STAT' ).
    lo_primitive_property->set_edm_name( 'OverallPurchaseConfStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_DELIVERY_BLOCK_STA' ).
    lo_primitive_property->set_edm_name( 'OverallDeliveryBlockStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_BILLING_BLOCK_STAT' ).
    lo_primitive_property->set_edm_name( 'OverallBillingBlockStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_DELIVERY_STATUS' ).
    lo_primitive_property->set_edm_name( 'OverallDeliveryStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_CREDIT_CHECK_STATUS' ).
    lo_primitive_property->set_edm_name( 'TotalCreditCheckStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_SDDOCUMENT_REJECTI' ).
    lo_primitive_property->set_edm_name( 'OverallSDDocumentRejectionSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TOTAL_BLOCK_STATUS' ).
    lo_primitive_property->set_edm_name( 'TotalBlockStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HDR_GENERAL_INCOMPLETION_S' ).
    lo_primitive_property->set_edm_name( 'HdrGeneralIncompletionStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVRL_ITM_GENERAL_INCOMPLET' ).
    lo_primitive_property->set_edm_name( 'OvrlItmGeneralIncompletionSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_SDDOC_REFERENCE_ST' ).
    lo_primitive_property->set_edm_name( 'OverallSDDocReferenceStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_DOC_APPROVAL_STATUS' ).
    lo_primitive_property->set_edm_name( 'SalesDocApprovalStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_CHML_CMPLNC_STATUS' ).
    lo_primitive_property->set_edm_name( 'OverallChmlCmplncStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_DANGEROUS_GOODS_ST' ).
    lo_primitive_property->set_edm_name( 'OverallDangerousGoodsStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_SAFETY_DATA_SHEET' ).
    lo_primitive_property->set_edm_name( 'OverallSafetyDataSheetStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_TRD_CMPLNC_EMBARGO' ).
    lo_primitive_property->set_edm_name( 'OverallTrdCmplncEmbargoSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVRL_TRD_CMPLNC_SNCTND_LIS' ).
    lo_primitive_property->set_edm_name( 'OvrlTrdCmplncSnctndListChkSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVRL_TRD_CMPLNC_LEGAL_CTRL' ).
    lo_primitive_property->set_edm_name( 'OvrlTrdCmplncLegalCtrlChkSts' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_DOWN_PAYMENT_S' ).
    lo_primitive_property->set_edm_name( 'SalesOrderDownPaymentStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OVERALL_ORD_RELTD_BILLG_ST' ).
    lo_primitive_property->set_edm_name( 'OverallOrdReltdBillgStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SLS_DOC_OVRL_SUPPLY_BLOCK' ).
    lo_primitive_property->set_edm_name( 'SlsDocOvrlSupplyBlockStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_complex_property = lo_entity_type->create_complex_property( 'SAP_MESSAGES' ).
    lo_complex_property->set_edm_name( 'SAP__Messages' ) ##NO_TEXT.
    lo_complex_property->set_complex_type( 'SAP_MESSAGE' ).
    lo_complex_property->set_is_collection( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'ITEM' ).
    lo_navigation_property->set_edm_name( '_Item' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_ITEM_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PARTNER' ).
    lo_navigation_property->set_edm_name( '_Partner' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_PARTNER_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'PRICING_ELEMENT' ).
    lo_navigation_property->set_edm_name( '_PricingElement' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_PRICING_ELEM_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'RELATED_OBJECT' ).
    lo_navigation_property->set_edm_name( '_RelatedObject' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_RELATED_OBJE_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TEXT' ).
    lo_navigation_property->set_edm_name( '_Text' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SALES_ORDER_TEXT_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

  ENDMETHOD.


  METHOD def_sap_message.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'SAP_MESSAGE'
                                    is_structure              = VALUE tys_sap_message( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'SAP__Message' ) ##NO_TEXT.
    lo_complex_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_primitive_property = lo_complex_type->get_primitive_property( 'CODE' ).
    lo_primitive_property->set_edm_name( 'code' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'MESSAGE' ).
    lo_primitive_property->set_edm_name( 'message' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'TARGET' ).
    lo_primitive_property->set_edm_name( 'target' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'ADDITIONAL_TARGETS' ).
    lo_primitive_property->set_edm_name( 'additionalTargets' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_collection( ).

    lo_primitive_property = lo_complex_type->get_primitive_property( 'TRANSITION' ).
    lo_primitive_property->set_edm_name( 'transition' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'NUMERIC_SEVERITY' ).
    lo_primitive_property->set_edm_name( 'numericSeverity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Byte' ) ##NO_TEXT.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'LONGTEXT_URL' ).
    lo_primitive_property->set_edm_name( 'longtextUrl' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

  ENDMETHOD.


  METHOD def_set_assigned_values.

    DATA:
      lo_action        TYPE REF TO /iwbep/if_v4_pm_action,
      lo_action_import TYPE REF TO /iwbep/if_v4_pm_action_imp,
      lo_parameter     TYPE REF TO /iwbep/if_v4_pm_act_param,
      lo_return        TYPE REF TO /iwbep/if_v4_pm_act_return.


    lo_action = mo_model->create_action( 'SET_ASSIGNED_VALUES' ).
    lo_action->set_edm_name( 'SetAssignedValues' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_action->/iwbep/if_v4_pm_ac_advanced~set_parameter_structure_info( VALUE tys_parameters_1( ) ).


    lo_parameter = lo_action->create_parameter( 'IT' ).
    lo_parameter->set_edm_name( '_it' ) ##NO_TEXT.
    lo_parameter->set_entity_type( 'VARIANT_CONFIGURATION_TYPE' ).
    lo_parameter->set_is_binding_parameter( ).

    lo_parameter = lo_action->create_parameter( 'VAR_CONFIGN_INSTCE_HIER_NO' ).
    lo_parameter->set_edm_name( 'VarConfignInstceHierNodeID' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'VAR_CONFIGN_INSTCE_HIER_NO' ).

    lo_parameter = lo_action->create_parameter( 'CHARACTERISTIC' ).
    lo_parameter->set_edm_name( '_Characteristic' ) ##NO_TEXT.
    lo_parameter->set_complex_type( 'D_VAR_CNF_SET_ASSGD_VALS_C' ).
    lo_parameter->set_is_collection( ).

    lo_parameter = lo_action->create_parameter( 'SUBORD_INSTANCE' ).
    lo_parameter->set_edm_name( '_SubordInstance' ) ##NO_TEXT.
    lo_parameter->set_complex_type( 'D_VAR_CNF_SET_ASSGD_VALS_I' ).
    lo_parameter->set_is_collection( ).

  ENDMETHOD.


  METHOD def_update_prices.

    DATA:
      lo_action        TYPE REF TO /iwbep/if_v4_pm_action,
      lo_action_import TYPE REF TO /iwbep/if_v4_pm_action_imp,
      lo_parameter     TYPE REF TO /iwbep/if_v4_pm_act_param,
      lo_return        TYPE REF TO /iwbep/if_v4_pm_act_return.


    lo_action = mo_model->create_action( 'UPDATE_PRICES' ).
    lo_action->set_edm_name( 'UpdatePrices' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_action->/iwbep/if_v4_pm_ac_advanced~set_parameter_structure_info( VALUE tys_parameters_2( ) ).


    lo_parameter = lo_action->create_parameter( 'IT' ).
    lo_parameter->set_edm_name( '_it' ) ##NO_TEXT.
    lo_parameter->set_entity_type( 'SALES_ORDER_ITEM_TYPE' ).
    lo_parameter->set_is_binding_parameter( ).

    lo_parameter = lo_action->create_parameter( 'PRICING_TYPE' ).
    lo_parameter->set_edm_name( 'PricingType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'PRICING_TYPE' ).

  ENDMETHOD.


  METHOD def_update_prices_2.

    DATA:
      lo_action        TYPE REF TO /iwbep/if_v4_pm_action,
      lo_action_import TYPE REF TO /iwbep/if_v4_pm_action_imp,
      lo_parameter     TYPE REF TO /iwbep/if_v4_pm_act_param,
      lo_return        TYPE REF TO /iwbep/if_v4_pm_act_return.


    lo_action = mo_model->create_action( 'UPDATE_PRICES_2' ).
    lo_action->set_edm_name( 'UpdatePrices' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_action->/iwbep/if_v4_pm_ac_advanced~set_parameter_structure_info( VALUE tys_parameters_3( ) ).


    lo_parameter = lo_action->create_parameter( 'IT' ).
    lo_parameter->set_edm_name( '_it' ) ##NO_TEXT.
    lo_parameter->set_entity_type( 'SALES_ORDER_TYPE' ).
    lo_parameter->set_is_binding_parameter( ).

    lo_parameter = lo_action->create_parameter( 'PRICING_TYPE' ).
    lo_parameter->set_edm_name( 'PricingType' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'PRICING_TYPE_2' ).

  ENDMETHOD.


  METHOD def_variant_configuration_inst.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VARIANT_CONFIGURATION_INST'
                                    is_structure              = VALUE tys_variant_configuration_inst( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VariantConfigurationInstance_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).



    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGURATION_BUS_OBJE' ).
    lo_primitive_property->set_edm_name( 'VarConfigurationBusObjectKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGURATION_BUS_OB_2' ).
    lo_primitive_property->set_edm_name( 'VarConfigurationBusObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGN_INSTCE_INTERNA' ).
    lo_primitive_property->set_edm_name( 'VarConfignInstceInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGN_PAR_INSTCE_INT' ).
    lo_primitive_property->set_edm_name( 'VarConfignParInstceInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT' ).
    lo_primitive_property->set_edm_name( 'Product' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IDENTIFIER_BOMITEM' ).
    lo_primitive_property->set_edm_name( 'IdentifierBOMItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BILL_OF_MATERIAL_ITEM_NUMB' ).
    lo_primitive_property->set_edm_name( 'BillOfMaterialItemNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VARIANT_CONFIGURATION_QUAN' ).
    lo_primitive_property->set_edm_name( 'VariantConfigurationQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGN_QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'VarConfignQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGN_QUANTITY_ISOUN' ).
    lo_primitive_property->set_edm_name( 'VarConfignQuantityISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'CHARACTERISTIC' ).
    lo_navigation_property->set_edm_name( '_Characteristic' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'VAR_CONFIGN_CHARACTERISTIC' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'VARIANT_CONFIGURATION' ).
    lo_navigation_property->set_edm_name( '_VariantConfiguration' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'VARIANT_CONFIGURATION_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_variant_configuration_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VARIANT_CONFIGURATION_TYPE'
                                    is_structure              = VALUE tys_variant_configuration_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VariantConfiguration_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).



    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGURATION_BUS_OBJE' ).
    lo_primitive_property->set_edm_name( 'VarConfigurationBusObjectKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGURATION_BUS_OB_2' ).
    lo_primitive_property->set_edm_name( 'VarConfigurationBusObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGN_STATUS' ).
    lo_primitive_property->set_edm_name( 'VarConfignStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGE_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'LastChangeDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'INSTANCE' ).
    lo_navigation_property->set_edm_name( '_Instance' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'VARIANT_CONFIGURATION_INST' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

  ENDMETHOD.


  METHOD def_var_confign_assigned_value.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VAR_CONFIGN_ASSIGNED_VALUE'
                                    is_structure              = VALUE tys_var_confign_assigned_value( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VarConfignAssignedValue_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).



    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGURATION_BUS_OBJE' ).
    lo_primitive_property->set_edm_name( 'VarConfigurationBusObjectKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGURATION_BUS_OB_2' ).
    lo_primitive_property->set_edm_name( 'VarConfigurationBusObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGN_INSTCE_INTERNA' ).
    lo_primitive_property->set_edm_name( 'VarConfignInstceInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARACTERISTIC' ).
    lo_primitive_property->set_edm_name( 'Characteristic' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VARIANT_CONFIGURATION_VALU' ).
    lo_primitive_property->set_edm_name( 'VariantConfigurationValueID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 150 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARACTERISTIC_VAL' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharacteristicValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_VALUE_DESCRI' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcValueDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_FROM_QUANTIT' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcFromQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_FROM_QUANT_2' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcFromQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_FROM_QUANT_3' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcFromQuantityISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_TO_QUANTITY' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcToQuantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_TO_QUANTIT_2' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcToQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_TO_QUANTIT_3' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcToQuantityISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_FROM_NUMERIC' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcFromNumericValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_TO_NUMERIC_V' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcToNumericValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_FROM_DATE' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcFromDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_FROM_TIME' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcFromTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_FROM_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcFromAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_TO_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcToAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGN_VALUE_ASSIGNME' ).
    lo_primitive_property->set_edm_name( 'VarConfignValueAssignmentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'CHARACTERISTIC_2' ).
    lo_navigation_property->set_edm_name( '_Characteristic' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'VAR_CONFIGN_CHARACTERISTIC' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'VARIANT_CONFIGURATION' ).
    lo_navigation_property->set_edm_name( '_VariantConfiguration' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'VARIANT_CONFIGURATION_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.


  METHOD def_var_confign_characteristic.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'VAR_CONFIGN_CHARACTERISTIC'
                                    is_structure              = VALUE tys_var_confign_characteristic( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'VarConfignCharacteristic_Type' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).



    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGURATION_BUS_OBJE' ).
    lo_primitive_property->set_edm_name( 'VarConfigurationBusObjectKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGURATION_BUS_OB_2' ).
    lo_primitive_property->set_edm_name( 'VarConfigurationBusObjectType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CONFIGN_INSTCE_INTERNA' ).
    lo_primitive_property->set_edm_name( 'VarConfignInstceInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARACTERISTIC' ).
    lo_primitive_property->set_edm_name( 'Characteristic' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARC_DATA_TYPE' ).
    lo_primitive_property->set_edm_name( 'CharcDataType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARC_TEMPLATE' ).
    lo_primitive_property->set_edm_name( 'CharcTemplate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 70 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY' ).
    lo_primitive_property->set_edm_name( 'Currency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARC_VALUE_UNIT' ).
    lo_primitive_property->set_edm_name( 'CharcValueUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VAR_CNF_CHARC_ISOUNIT' ).
    lo_primitive_property->set_edm_name( 'VarCnfCharcISOUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_READ_ONLY' ).
    lo_primitive_property->set_edm_name( 'IsReadOnly' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENTRY_IS_REQUIRED' ).
    lo_primitive_property->set_edm_name( 'EntryIsRequired' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CHARC_IS_HIDDEN' ).
    lo_primitive_property->set_edm_name( 'CharcIsHidden' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADDITIONAL_VALUE_IS_ALLOWE' ).
    lo_primitive_property->set_edm_name( 'AdditionalValueIsAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MULTIPLE_VALUES_ARE_ALLOWE' ).
    lo_primitive_property->set_edm_name( 'MultipleValuesAreAllowed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ETAG' ).
    lo_primitive_property->set_edm_name( 'ETAG' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->use_as_etag( ).
    lo_primitive_property->set_is_technical( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'ASSIGNED_VALUE' ).
    lo_navigation_property->set_edm_name( '_AssignedValue' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'VAR_CONFIGN_ASSIGNED_VALUE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'INSTANCE' ).
    lo_navigation_property->set_edm_name( '_Instance' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'VARIANT_CONFIGURATION_INST' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'VARIANT_CONFIGURATION' ).
    lo_navigation_property->set_edm_name( '_VariantConfiguration' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'VARIANT_CONFIGURATION_TYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

  ENDMETHOD.
ENDCLASS.
