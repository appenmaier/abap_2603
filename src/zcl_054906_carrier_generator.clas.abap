CLASS zcl_054906_carrier_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_054906_carrier_generator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA carriers TYPE TABLE OF z054906_carriera.
    DATA carrier TYPE z054906_carriera.

    DELETE FROM z054906_carriera.

    carrier-client = sy-mandt.
    carrier-carrier_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    carrier-carrier_id = 'LH'.
    carrier-carrier_name = 'Lufthansa'.
    APPEND carrier TO carriers.

    carrier-carrier_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    carrier-carrier_id = 'UA'.
    carrier-carrier_name = 'United Airlines'.
    APPEND carrier TO carriers.

    carrier-carrier_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    carrier-carrier_id = 'JL'.
    carrier-carrier_name = 'Japan Airlines'.
    APPEND carrier TO carriers.

    INSERT z054906_carriera FROM TABLE @carriers.

  ENDMETHOD.

ENDCLASS.
