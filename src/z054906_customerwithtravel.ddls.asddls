@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer with Travel'
define view entity Z054906_CustomerWithTravel
  as select from Z054906_Customer
  association [0..*] to Z054906_Travel as _Travels on $projection.CustomerId = _Travels.CustomerId
{
  key CustomerId,
      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,

      _Travels
}
where
  CountryCode = 'DE'
