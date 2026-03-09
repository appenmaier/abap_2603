CLASS zcl_054906_demo_01 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA travels TYPE TABLE OF /DMO/I_Travel_D.

    SELECT FROM /DMO/I_Travel_D
      FIELDS *
      INTO TABLE @travels.

    out->write( travels ).
  ENDMETHOD.
ENDCLASS.
