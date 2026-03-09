@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel with Customer'
define view entity Z054906_TravelWithCustomer
  as select from Z054906_Travel   as t
    inner join   Z054906_Customer as c on t.CustomerId = c.CustomerId
{
  key t.TravelId,
      t.AgencyId,
      t.BeginDate,
      t.EndDate,
      t.BookingFee,
      t.TotalPrice,
      t.CurrencyCode,
      t.Description,
      t.Status,
      t.CustomerId,
      c.FirstName,
      c.LastName,
      c.Title,
      c.Street,
      c.PostalCode,
      c.City
}

where
  c.CountryCode = 'DE'
