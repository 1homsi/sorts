REPORT ZRADIXSORT.

DATA: lt_arr TYPE TABLE OF i,
      lt_output TYPE TABLE OF i,
      lt_count TYPE TABLE OF i,
      lv_max TYPE i,
      lv_exp TYPE i,
      lv_n TYPE i,
      lv_idx TYPE i,
      lv_val TYPE i,
      lv_pos TYPE i.

START-OF-SELECTION.
  APPEND 170 TO lt_arr.
  APPEND 45  TO lt_arr.
  APPEND 75  TO lt_arr.
  APPEND 90  TO lt_arr.
  APPEND 802 TO lt_arr.
  APPEND 24  TO lt_arr.
  APPEND 2   TO lt_arr.
  APPEND 66  TO lt_arr.

  lv_n = 8.
  lv_max = 0.
  LOOP AT lt_arr INTO lv_val.
    IF lv_val > lv_max.
      lv_max = lv_val.
    ENDIF.
  ENDLOOP.

  lv_exp = 1.
  WHILE lv_max / lv_exp > 1.
    CLEAR lt_count.
    DO 10 TIMES.
      APPEND 0 TO lt_count.
    ENDDO.
    CLEAR lt_output.
    DO lv_n TIMES.
      APPEND 0 TO lt_output.
    ENDDO.

    LOOP AT lt_arr INTO lv_val.
      lv_idx = ( lv_val / lv_exp ) MOD 10 + 1.
      READ TABLE lt_count INTO lv_pos INDEX lv_idx.
      lv_pos = lv_pos + 1.
      MODIFY lt_count INDEX lv_idx FROM lv_pos.
    ENDLOOP.

    DO 9 TIMES.
      lv_idx = sy-index + 1.
      READ TABLE lt_count INTO lv_pos INDEX lv_idx.
      DATA lv_prev TYPE i.
      READ TABLE lt_count INTO lv_prev INDEX sy-index.
      lv_pos = lv_pos + lv_prev.
      MODIFY lt_count INDEX lv_idx FROM lv_pos.
    ENDDO.

    DO lv_n TIMES.
      lv_idx = lv_n - sy-index + 1.
      READ TABLE lt_arr INTO lv_val INDEX lv_idx.
      DATA lv_digit TYPE i.
      lv_digit = ( lv_val / lv_exp ) MOD 10 + 1.
      READ TABLE lt_count INTO lv_pos INDEX lv_digit.
      MODIFY lt_output INDEX lv_pos FROM lv_val.
      lv_pos = lv_pos - 1.
      MODIFY lt_count INDEX lv_digit FROM lv_pos.
    ENDDO.

    lt_arr = lt_output.
    lv_exp = lv_exp * 10.
  ENDWHILE.

  LOOP AT lt_arr INTO lv_val.
    WRITE: / lv_val.
  ENDLOOP.
