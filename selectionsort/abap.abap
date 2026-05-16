REPORT selection_sort.
DATA: lt_arr TYPE TABLE OF i,
      lv_n   TYPE i,
      lv_i   TYPE i,
      lv_j   TYPE i,
      lv_min TYPE i,
      lv_tmp TYPE i,
      lv_val TYPE i.

FORM selection_sort CHANGING ct_arr TYPE table.
  lv_n = lines( ct_arr ).
  DO lv_n - 1 TIMES.
    lv_i = sy-index.
    lv_min = lv_i.
    lv_j = lv_i + 1.
    WHILE lv_j <= lv_n.
      READ TABLE ct_arr INDEX lv_j INTO lv_val.
      READ TABLE ct_arr INDEX lv_min INTO lv_tmp.
      IF lv_val < lv_tmp.
        lv_min = lv_j.
      ENDIF.
      lv_j = lv_j + 1.
    ENDWHILE.
    READ TABLE ct_arr INDEX lv_i INTO lv_tmp.
    READ TABLE ct_arr INDEX lv_min INTO lv_val.
    MODIFY ct_arr INDEX lv_i FROM lv_val.
    MODIFY ct_arr INDEX lv_min FROM lv_tmp.
  ENDDO.
ENDFORM.
