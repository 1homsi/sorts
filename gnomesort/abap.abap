CLASS gnome_sort DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS sort CHANGING arr TYPE int4_table.
ENDCLASS.

CLASS gnome_sort IMPLEMENTATION.
  METHOD sort.
    DATA i TYPE i VALUE 1.
    DATA n TYPE i.
    DATA tmp TYPE i.
    n = lines( arr ).
    WHILE i <= n.
      IF i = 1 OR arr[ i ] >= arr[ i - 1 ].
        i = i + 1.
      ELSE.
        tmp = arr[ i ].
        arr[ i ] = arr[ i - 1 ].
        arr[ i - 1 ] = tmp.
        i = i - 1.
      ENDIF.
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.
