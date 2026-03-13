CLASS zcl_054906_demo_01 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM Z054906_FlightWithCarrierName( p_carrierid = 'LH' )
      FIELDS CarrierId, ConnectionId, \_Connection-AirportFromId, \_Connection-AirportToId
      INTO TABLE @DATA(flights).

    out->write( flights ).
  ENDMETHOD.
ENDCLASS.
