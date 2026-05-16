REPORT zbogosort.

DATA: lt_arr TYPE TABLE OF i,
      lv_sorted TYPE abap_bool,
      lv_tmp TYPE i,
      lv_n TYPE i,
      lv_j TYPE i,
      lv_rand TYPE f.

FORM is_sorted USING it_arr TYPE TABLE CHANGING cv_sorted TYPE abap_bool.
  DATA: lv_prev TYPE i, lv_curr TYPE i, lv_idx TYPE i.
  cv_sorted = abap_true.
  lv_idx = 1.
  LOOP AT it_arr INTO lv_curr.
    IF lv_idx > 1 AND lv_prev > lv_curr.
      cv_sorted = abap_false.
      RETURN.
    ENDIF.
    lv_prev = lv_curr.
    ADD 1 TO lv_idx.
  ENDLOOP.
ENDFORM.

FORM shuffle CHANGING ct_arr TYPE TABLE.
  DATA: lv_size TYPE i, lv_j TYPE i, lv_tmp TYPE i, lv_i TYPE i.
  lv_size = lines( ct_arr ).
  DO lv_size TIMES.
    lv_i = lv_size - sy-index + 1.
    CALL FUNCTION 'QF05_RANDOM_INTEGER'
      EXPORTING iv_min = 1 iv_max = lv_i
      IMPORTING ev_rand = lv_j.
    READ TABLE ct_arr INDEX lv_i INTO lv_tmp.
    READ TABLE ct_arr INDEX lv_j INTO DATA(lv_jval).
    MODIFY ct_arr INDEX lv_i FROM lv_jval.
    MODIFY ct_arr INDEX lv_j FROM lv_tmp.
  ENDDO.
ENDFORM.

START-OF-SELECTION.
  APPEND 3 TO lt_arr. APPEND 1 TO lt_arr. APPEND 4 TO lt_arr.
  APPEND 1 TO lt_arr. APPEND 5 TO lt_arr. APPEND 9 TO lt_arr.
  APPEND 2 TO lt_arr. APPEND 6 TO lt_arr.

  DO.
    PERFORM is_sorted USING lt_arr CHANGING lv_sorted.
    IF lv_sorted = abap_true. EXIT. ENDIF.
    PERFORM shuffle CHANGING lt_arr.
  ENDDO.

  LOOP AT lt_arr INTO DATA(lv_val).
    WRITE: lv_val.
  ENDLOOP.
