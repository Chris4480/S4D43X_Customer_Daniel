CLASS zcl_00_a_increase_discount DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_action~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_a_increase_discount IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.

    " Datenobjekte deklarieren
    DATA customers TYPE zti00_customertp.

    " BO-Daten lesen
    io_read->retrieve(
      EXPORTING
        iv_node       = is_ctx-node_key
        it_key        = it_key
      IMPORTING
        eo_message    = eo_message
        et_data       = customers
        et_failed_key = et_failed_key ).

    " Nachrichten-Container erzeugen
    IF eo_message IS NOT BOUND.
      eo_message = /bobf/cl_frw_message_factory=>create_container( ).
    ENDIF.

    " BO-Daten sequentiell durchlaufen
    LOOP AT customers REFERENCE INTO DATA(customer).
      IF customer->discount + 5 > 100.
        customer->discount = 100.

        DATA(message) = NEW zcm_00_connection(
          textid   = zcm_00_connection=>co_switched_successfully
          severity = zcm_00_connection=>co_severity_info ).

        eo_message->add_cm( message ).
      ELSE.
        customer->discount += 5.
      ENDIF.

      io_modify->update(
        EXPORTING
          iv_node = is_ctx-node_key
          iv_key  = customer->key
          is_data = customer ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
