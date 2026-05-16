REPORT z_shell_sort.

DATA: lt_arr TYPE TABLE OF i,
      lv_n   TYPE i,
      lv_gap TYPE i,
      lv_i   TYPE i,
      lv_j   TYPE i,
      lv_temp TYPE i,
      lv_jg  TYPE i,
      lv_val TYPE i.

APPEND 64 TO lt_arr.
APPEND 34 TO lt_arr.
APPEND 25 TO lt_arr.
APPEND 12 TO lt_arr.
APPEND 22 TO lt_arr.
APPEND 11 TO lt_arr.
APPEND 90 TO lt_arr.

lv_n = lines( lt_arr ).
lv_gap = lv_n / 2.

WHILE lv_gap > 0.
  lv_i = lv_gap + 1.
  WHILE lv_i <= lv_n.
    READ TABLE lt_arr INDEX lv_i INTO lv_temp.
    lv_j = lv_i.
    lv_jg = lv_j - lv_gap.
    READ TABLE lt_arr INDEX lv_jg INTO lv_val.
    WHILE lv_j > lv_gap AND lv_val > lv_temp.
      MODIFY lt_arr INDEX lv_j FROM lv_val.
      lv_j = lv_j - lv_gap.
      lv_jg = lv_j - lv_gap.
      IF lv_j > lv_gap.
        READ TABLE lt_arr INDEX lv_jg INTO lv_val.
      ENDIF.
    ENDWHILE.
    MODIFY lt_arr INDEX lv_j FROM lv_temp.
    lv_i = lv_i + 1.
  ENDWHILE.
  lv_gap = lv_gap / 2.
ENDWHILE.

LOOP AT lt_arr INTO lv_val.
  WRITE: lv_val, ' '.
ENDLOOP.
