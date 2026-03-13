@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight with Connection and Carrier'
define view entity Z054906_FlightWithConnAndCarr
  with parameters
    P_CarrierId : /dmo/carrier_id,
    @Environment.systemField: #SYSTEM_DATE
    P_Deadline  : /dmo/flight_date
  as select from Z054906_Flight
  association [1..1] to Z054906_FlightConnection as _Connection on  $projection.CarrierId    = _Connection.CarrierId
                                                                and $projection.ConnectionId = _Connection.ConnectionId
  association [1..1] to Z054906_Carrier          as _Carrier    on  $projection.CarrierId = _Carrier.CarrierId
  association [0..*] to /dmo/booking             as _Bookings   on  $projection.CarrierId    = _Bookings.carrier_id
                                                                and $projection.ConnectionId = _Bookings.connection_id
                                                                and $projection.FlightDate   = _Bookings.flight_date
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,

      /* Associations */
      _Carrier,
      _Connection,
      _Bookings
}
where
      CarrierId  = $parameters.P_CarrierId
  and FlightDate > $parameters.P_Deadline // Selektion
