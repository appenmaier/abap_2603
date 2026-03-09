@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SQL Functions'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z054906_SqlFunctions
  as select from /dmo/flight
{
  /* Literals */
  'Hello World'                                   as String1,
  42                                              as Integer1,
  3.14                                            as Fltp1,

  /* Arithmetic Operators and Type Casts */
  seats_max,
  seats_occupied,
  @EndUserText.label: 'Free Seats'
  @EndUserText.quickInfo: 'Free Seats'
  seats_max - seats_occupied                      as FreeSeats,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  price * 2                                       as DoublePrice,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  cast(price as abap.fltp) * 1.1                  as NewPrice,
  currency_code                                   as CurrencyCode,
  carrier_id                                      as CarrierId,
  'LH '                                           as CarrierId2,
  cast('LH ' as /dmo/carrier_id)                  as CarrierId3,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  cast(price as abap.fltp) / 2.0                  as HalfPrice,

  /* Cases and Branches */
  case plane_type_id when 'A340-600' then 'Airbus'
                     when 'A320-200' then 'Airbus'
                     when '747-400' then 'Boeing'
                     else plane_type_id
  end                                             as Manufacturer,
  case when seats_max - seats_occupied < 50 then 'X'
       else ''
  end                                             as IsAlmostBookedUp,

  /* Built-In Functions */
  division(cast(price as abap.dec(16,2)), 2, 1)   as HalfPrice2,
  concat_with_space(carrier_id, connection_id, 1) as FlightConnection,
  length('   ')                                   as SSS,
  length('X  ')                                   as XSS,
  length('  X')                                   as SSX,
  @Semantics.amount.currencyCode: 'NewCurrencyCode'
  currency_conversion(
    amount => price,
    source_currency => currency_code,
    target_currency => cast('EUR' as abap.cuky),
    exchange_rate_date => $session.system_date,
    error_handling => 'KEEP_UNCONVERTED' )        as NewerPrice,
  cast('EUR' as abap.cuky)                        as NewCurrencyCode,
  dats_add_days(flight_date, 1, 'FAIL')           as NewFlightDate
}
