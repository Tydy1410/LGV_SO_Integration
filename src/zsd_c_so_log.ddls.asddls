@AbapCatalog.sqlViewName: 'ZSQL_SOLOG'
@AbapCatalog.compiler.compareFilter: true

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Expose C1 for Root View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_DATA_SOURCE ]

define view ZSD_C_SO_LOG as select from ZSD_I_SO_LOG
{
    key LogUuid,
    key SapSoId,
    key ShopifySoID,
    Status,
    Message,
    CreatedAt,
    CreatedBy,
    CreatedOn,
    CreatedByDesc,
    LastChangedAt,
    LastChangedBy,
    LastChangedOn
}
