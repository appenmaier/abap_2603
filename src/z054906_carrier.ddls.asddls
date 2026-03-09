@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z054906_Carrier
  as select from /dmo/carrier
{
  key carrier_id    as CarrierId,
      name          as Name,
      currency_code as CurrencyCode
}
