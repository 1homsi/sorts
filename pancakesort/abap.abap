REPORT pancake_sort.

DATA: lt_arr TYPE TABLE OF i,
      lv_size TYPE i,
      lv_max_idx TYPE i,
      lv_left TYPE i,
      lv_right TYPE i,
      lv_tmp TYPE i,
      lv_val TYPE i,
      lv_max TYPE i,
      lv_i TYPE i.

APPEND 3 TO lt_arr.
APPEND 6 TO lt_arr.
APPEND 2 TO lt_arr.
APPEND 7 TO lt_arr.
APPEND 4 TO lt_arr.
APPEND 1 TO lt_arr.
APPEND 5 TO lt_arr.

lv_size = lines( lt_arr ).

FORM flip USING p_k TYPE i.
  lv_left = 1.
  lv_right = p_k + 1.
  WHILE lv_left < lv_right.
    READ TABLE lt_arr INDEX lv_left INTO lv_tmp.
    READ TABLE lt_arr INDEX lv_right INTO lv_val.
    MODIFY lt_arr INDEX lv_left FROM lv_val.
    MODIFY lt_arr INDEX lv_right FROM lv_tmp.
    lv_left = lv_left + 1.
    lv_right = lv_right - 1.
  ENDWHILE.
ENDFORM.

DO.
  IF lv_size <= 1. EXIT. ENDIF.
  lv_max_idx = 1.
  lv_max = 0.
  DO lv_size TIMES.
    lv_i = sy-index.
    READ TABLE lt_arr INDEX lv_i INTO lv_val.
    IF lv_val > lv_max.
      lv_max = lv_val.
      lv_max_idx = lv_i.
    ENDIF.
  ENDDO.
  IF lv_max_idx <> lv_size.
    IF lv_max_idx <> 1.
      PERFORM flip USING lv_max_idx - 1.
    ENDIF.
    PERFORM flip USING lv_size - 1.
  ENDIF.
  lv_size = lv_size - 1.
ENDDO.

LOOP AT lt_arr INTO lv_val.
  WRITE: / lv_val.
ENDLOOP.
