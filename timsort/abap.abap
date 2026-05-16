REPORT ztimsort.

TYPES: ty_int_tab TYPE STANDARD TABLE OF i WITH DEFAULT KEY.

CONSTANTS: c_min_run TYPE i VALUE 32.

FORM insertion_sort CHANGING ct_arr TYPE ty_int_tab
                    USING iv_left TYPE i iv_right TYPE i.
  DATA: lv_key TYPE i,
        lv_j   TYPE i,
        lv_val TYPE i.
  DATA: lv_i TYPE i.
  lv_i = iv_left + 1.
  WHILE lv_i <= iv_right.
    READ TABLE ct_arr INTO lv_key INDEX lv_i.
    lv_j = lv_i - 1.
    WHILE lv_j >= iv_left.
      READ TABLE ct_arr INTO lv_val INDEX lv_j.
      IF lv_val > lv_key.
        MODIFY ct_arr FROM lv_val INDEX lv_j + 1.
        lv_j = lv_j - 1.
      ELSE.
        EXIT.
      ENDIF.
    ENDWHILE.
    MODIFY ct_arr FROM lv_key INDEX lv_j + 1.
    lv_i = lv_i + 1.
  ENDWHILE.
ENDFORM.

FORM merge CHANGING ct_arr TYPE ty_int_tab
           USING iv_left TYPE i iv_mid TYPE i iv_right TYPE i.
  DATA: lt_lp TYPE ty_int_tab,
        lt_rp TYPE ty_int_tab,
        lv_val TYPE i,
        lv_i TYPE i, lv_j TYPE i, lv_k TYPE i.
  DATA: lv_ln TYPE i, lv_rn TYPE i.
  lv_ln = iv_mid - iv_left + 1.
  lv_rn = iv_right - iv_mid.
  DO lv_ln TIMES.
    READ TABLE ct_arr INTO lv_val INDEX iv_left + sy-index - 1.
    APPEND lv_val TO lt_lp.
  ENDDO.
  DO lv_rn TIMES.
    READ TABLE ct_arr INTO lv_val INDEX iv_mid + sy-index.
    APPEND lv_val TO lt_rp.
  ENDDO.
  lv_i = 1. lv_j = 1. lv_k = iv_left.
  WHILE lv_i <= lv_ln AND lv_j <= lv_rn.
    DATA: lv_lv TYPE i, lv_rv TYPE i.
    READ TABLE lt_lp INTO lv_lv INDEX lv_i.
    READ TABLE lt_rp INTO lv_rv INDEX lv_j.
    IF lv_lv <= lv_rv.
      MODIFY ct_arr FROM lv_lv INDEX lv_k. lv_i = lv_i + 1.
    ELSE.
      MODIFY ct_arr FROM lv_rv INDEX lv_k. lv_j = lv_j + 1.
    ENDIF.
    lv_k = lv_k + 1.
  ENDWHILE.
  WHILE lv_i <= lv_ln.
    READ TABLE lt_lp INTO lv_val INDEX lv_i.
    MODIFY ct_arr FROM lv_val INDEX lv_k.
    lv_i = lv_i + 1. lv_k = lv_k + 1.
  ENDWHILE.
  WHILE lv_j <= lv_rn.
    READ TABLE lt_rp INTO lv_val INDEX lv_j.
    MODIFY ct_arr FROM lv_val INDEX lv_k.
    lv_j = lv_j + 1. lv_k = lv_k + 1.
  ENDWHILE.
ENDFORM.

DATA: lt_arr TYPE ty_int_tab,
      lv_n TYPE i,
      lv_i TYPE i, lv_size TYPE i, lv_left TYPE i,
      lv_mid TYPE i, lv_right TYPE i.

APPEND 5 TO lt_arr. APPEND 2 TO lt_arr. APPEND 8 TO lt_arr.
APPEND 1 TO lt_arr. APPEND 9 TO lt_arr. APPEND 3 TO lt_arr.
APPEND 7 TO lt_arr. APPEND 4 TO lt_arr. APPEND 6 TO lt_arr.
lv_n = 9.
lv_i = 1.
WHILE lv_i <= lv_n.
  lv_right = lv_i + c_min_run - 1.
  IF lv_right > lv_n. lv_right = lv_n. ENDIF.
  PERFORM insertion_sort CHANGING lt_arr USING lv_i lv_right.
  lv_i = lv_i + c_min_run.
ENDWHILE.
lv_size = c_min_run.
WHILE lv_size < lv_n.
  lv_left = 1.
  WHILE lv_left <= lv_n.
    lv_mid = lv_left + lv_size - 1.
    IF lv_mid > lv_n. lv_mid = lv_n. ENDIF.
    lv_right = lv_left + 2 * lv_size - 1.
    IF lv_right > lv_n. lv_right = lv_n. ENDIF.
    IF lv_mid < lv_right.
      PERFORM merge CHANGING lt_arr USING lv_left lv_mid lv_right.
    ENDIF.
    lv_left = lv_left + 2 * lv_size.
  ENDWHILE.
  lv_size = lv_size * 2.
ENDWHILE.
DATA: lv_out TYPE i.
LOOP AT lt_arr INTO lv_out.
  WRITE: / lv_out.
ENDLOOP.
