@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight with Connection and Carrier'
define view entity Z054906_FlightWithConnAndCarr
  as select from Z054906_Flight           as f
  /* Inner Joins */
    inner join   Z054906_FlightConnection as fc on  f.CarrierId    = fc.CarrierId
                                                and f.ConnectionId = fc.ConnectionId
    inner join   Z054906_Carrier          as c  on f.CarrierId = c.CarrierId
{
      /* Projektion */
  key f.CarrierId,
  key f.ConnectionId,
  key f.FlightDate,
      c.Name,
      fc.AirportFromId,
      fc.AirportToId
}
where
      f.CarrierId    = 'LH'
  and f.ConnectionId = '0400' // Selektion
