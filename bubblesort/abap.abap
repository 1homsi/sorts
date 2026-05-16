REPORT bubble_sort.

DATA: lt_arr TYPE TABLE OF i,
      lv_tmp TYPE i,
      lv_n   TYPE i,
      lv_swapped TYPE abap_bool.

START-OF-SELECTION.
  APPEND 64 TO lt_arr.
  APPEND 34 TO lt_arr.
  APPEND 25 TO lt_arr.
  APPEND 12 TO lt_arr.
  APPEND 22 TO lt_arr.
  APPEND 11 TO lt_arr.
  APPEND 90 TO lt_arr.

  lv_n = lines( lt_arr ).
  DO.
    lv_swapped = abap_false.
    DO lv_n - 1 TIMES.
      IF lt_arr[ sy-index ] > lt_arr[ sy-index + 1 ].
        lv_tmp = lt_arr[ sy-index ].
        lt_arr[ sy-index ] = lt_arr[ sy-index + 1 ].
        lt_arr[ sy-index + 1 ] = lv_tmp.
        lv_swapped = abap_true.
      ENDIF.
    ENDDO.
    lv_n = lv_n - 1.
    IF lv_swapped = abap_false.
      EXIT.
    ENDIF.
  ENDDO.

  LOOP AT lt_arr INTO lv_tmp.
    WRITE: / lv_tmp.
  ENDLOOP.
