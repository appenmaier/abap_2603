@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight KPIs'
define view entity Z054906_FlightKpis
  as select from Z054906_Flight
{
  key CarrierId,
  key ConnectionId,

      /* count */
      count(*)                                                        as TotalNumberOfFlights,
      count(distinct PlaneTypeId)                                     as NumberOfDifferentPlaneTypes,

      /* min/max */
      min(SeatsOccupied)                                              as MinSeatsOccupied,
      max(SeatsOccupied)                                              as MaxSeatsOccupied,

      /* sum */
      sum(SeatsOccupied)                                              as TotalSeatsOccupied,
      sum(case when SeatsOccupied / SeatsMax > 0.7 then 1 else 0 end) as NumberOfAlmostBookedUpFlights,

      /* average */
      avg(SeatsOccupied as abap.dec(16,0))                            as AverageSeatsOccupied,
      avg(cast(Price as abap.dec(16,0)) as abap.dec(16,0))            as AveragePrice,
      CurrencyCode
}
where
  SeatsOccupied > 100
group by
  CarrierId,
  ConnectionId,
  CurrencyCode
having
  sum(case when SeatsOccupied / SeatsMax > 0.7 then 1 else 0 end) = 0
