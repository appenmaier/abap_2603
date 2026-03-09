@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel with Customer'
define view entity Z054906_TravelWithCustomer
  as select from Z054906_Travel                                                as t
    inner join   Z054906_Customer                                              as c on t.CustomerId = c.CustomerId
    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: '/DMO/STATUS' ) as d on  d.value_low = t.Status
                                                                                    and d.language  = $session.system_language
{
  key t.TravelId,
      t.AgencyId,
      t.BeginDate,
      t.EndDate,
      @EndUserText.label: 'Duration'
      @EndUserText.quickInfo: 'Duration'
      dats_days_between(t.BeginDate, t.EndDate) + 1                 as Duration,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(currency_conversion(
        amount => t.BookingFee,
        source_currency => t.CurrencyCode,
        target_currency => cast('EUR' as abap.cuky),
        exchange_rate_date => $session.system_date,
        error_handling => 'KEEP_UNCONVERTED' ) as /dmo/booking_fee) as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(currency_conversion(
        amount => t.TotalPrice,
        source_currency => t.CurrencyCode,
        target_currency => cast('EUR' as abap.cuky),
        exchange_rate_date => $session.system_date,
        error_handling => 'KEEP_UNCONVERTED' ) as /dmo/total_price) as TotalPrice,
      cast('EUR' as /dmo/currency_code)                             as CurrencyCode,
      t.Description,
      t.Status,
      @EndUserText.label: 'Status Text'
      @EndUserText.quickInfo: 'Status Text'
      d.text as StatusText,
      t.CustomerId,
      @EndUserText.label: 'Customer Name'
      @EndUserText.quickInfo: 'Customer Name'
      case when c.Title is initial then concat_with_space(c.FirstName, c.LastName, 1)
           else concat_with_space(c.Title, concat_with_space(c.FirstName, c.LastName, 1), 1)
      end                                                           as CustomerName,
      c.Street,
      c.PostalCode,
      c.City
}

where
  c.CountryCode = 'DE'
