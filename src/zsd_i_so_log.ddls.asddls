@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Shopify Order Log'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSD_I_SO_LOG as select from ztb_so_log
{
    key log_uuid as LogUuid,
    key sap_so_id as SapSoId,
    key shopify_so_id as ShopifySoID,
    status as Status,
    message as Message,
    created_at as CreatedAt,
    created_by as CreatedBy,
    created_on as CreatedOn,
    created_by_desc as CreatedByDesc,
    last_changed_at as LastChangedAt,
    last_changed_by as LastChangedBy,
    last_changed_on as LastChangedOn
}
