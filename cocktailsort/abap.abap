REPORT cocktail_sort.

TYPES: ty_int_tab TYPE STANDARD TABLE OF i WITH DEFAULT KEY.

FORM cocktail_sort CHANGING ct_arr TYPE ty_int_tab.
  DATA: lv_swapped TYPE abap_bool VALUE abap_true,
        lv_start   TYPE i VALUE 1,
        lv_end     TYPE i,
        lv_tmp     TYPE i,
        lv_a       TYPE i,
        lv_b       TYPE i.

  lv_end = lines( ct_arr ).

  WHILE lv_swapped = abap_true.
    lv_swapped = abap_false.
    DO lv_end - lv_start TIMES.
      DATA(lv_i) = lv_start + sy-index - 1.
      READ TABLE ct_arr INDEX lv_i INTO lv_a.
      READ TABLE ct_arr INDEX lv_i + 1 INTO lv_b.
      IF lv_a > lv_b.
        MODIFY ct_arr INDEX lv_i FROM lv_b.
        MODIFY ct_arr INDEX lv_i + 1 FROM lv_a.
        lv_swapped = abap_true.
      ENDIF.
    ENDDO.
    IF lv_swapped = abap_false. EXIT. ENDIF.
    lv_swapped = abap_false.
    lv_end = lv_end - 1.
    DO lv_end - lv_start TIMES.
      lv_i = lv_end - sy-index.
      READ TABLE ct_arr INDEX lv_i INTO lv_a.
      READ TABLE ct_arr INDEX lv_i + 1 INTO lv_b.
      IF lv_a > lv_b.
        MODIFY ct_arr INDEX lv_i FROM lv_b.
        MODIFY ct_arr INDEX lv_i + 1 FROM lv_a.
        lv_swapped = abap_true.
      ENDIF.
    ENDDO.
    lv_start = lv_start + 1.
  ENDWHILE.
ENDFORM.
