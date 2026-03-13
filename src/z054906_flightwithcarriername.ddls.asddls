@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight with Carrier Name'
define view entity Z054906_FlightWithCarrierName
  with parameters
    P_CarrierId : /dmo/carrier_id,
    @Environment.systemField: #SYSTEM_DATE
    P_Deadline  : /dmo/flight_date
  as select from Z054906_FlightWithConnAndCarr( P_CarrierId: $parameters.P_CarrierId, P_Deadline: $parameters.P_Deadline )
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      _Carrier.Name as CarrierName,

      /* Associations */
      _Bookings,
      _Connection
}
