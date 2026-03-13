@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer KPIs'
define view entity Z054906_CustomerKpis
  with parameters
    P_City : /dmo/city
  as select from Z054906_TravelWithCustomer
{
  key CustomerId,
      CustomerName,
      Street,
      PostalCode,
      City,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(TotalPrice + BookingFee)    as TotalRevenue,
      CurrencyCode,
      avg(Duration as abap.dec(16,0)) as AverageDuration,
      count(distinct AgencyId)        as NumberOfDifferentAgencys
}
where
  City = $parameters.P_City
group by
  CustomerId,
  CustomerName,
  Street,
  PostalCode,
  City,
  CurrencyCode
having
  sum(TotalPrice + BookingFee) > 5000
