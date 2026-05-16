REPORT bucket_sort_demo.

TYPES: ty_float_tab TYPE TABLE OF f WITH DEFAULT KEY.

FORM insertion_sort CHANGING ct_bucket TYPE ty_float_tab.
  DATA: lv_n TYPE i,
        lv_key TYPE f,
        lv_j TYPE i,
        lv_i TYPE i.
  DESCRIBE TABLE ct_bucket LINES lv_n.
  lv_i = 2.
  WHILE lv_i <= lv_n.
    READ TABLE ct_bucket INDEX lv_i INTO lv_key.
    lv_j = lv_i - 1.
    WHILE lv_j >= 1.
      DATA(lv_cur) = 0.
      READ TABLE ct_bucket INDEX lv_j INTO lv_cur.
      IF lv_cur > lv_key.
        INSERT lv_cur INTO ct_bucket INDEX lv_j + 2.
        DELETE ct_bucket INDEX lv_j.
        lv_j = lv_j - 1.
      ELSE.
        EXIT.
      ENDIF.
    ENDWHILE.
    lv_i = lv_i + 1.
  ENDWHILE.
ENDFORM.

START-OF-SELECTION.
  DATA: lt_arr TYPE ty_float_tab,
        lv_min TYPE f,
        lv_max TYPE f,
        lv_idx TYPE i,
        lv_n TYPE i.

  APPEND '0.78' TO lt_arr.
  APPEND '0.17' TO lt_arr.
  APPEND '0.39' TO lt_arr.
  APPEND '0.26' TO lt_arr.
  APPEND '0.72' TO lt_arr.
  APPEND '0.94' TO lt_arr.
  APPEND '0.21' TO lt_arr.
  APPEND '0.12' TO lt_arr.
  APPEND '0.23' TO lt_arr.
  APPEND '0.68' TO lt_arr.

  DESCRIBE TABLE lt_arr LINES lv_n.
  lv_min = '0.78'. lv_max = '0.12'.

  LOOP AT lt_arr INTO DATA(lv_v).
    IF lv_v < lv_min. lv_min = lv_v. ENDIF.
    IF lv_v > lv_max. lv_max = lv_v. ENDIF.
  ENDLOOP.

  DATA: lt_buckets TYPE TABLE OF ty_float_tab.
  DO lv_n TIMES.
    DATA(lt_empty) = VALUE ty_float_tab( ).
    APPEND lt_empty TO lt_buckets.
  ENDDO.

  LOOP AT lt_arr INTO DATA(lv_num).
    lv_idx = TRUNC( ( lv_num - lv_min ) / ( lv_max - lv_min + 1 ) * lv_n ) + 1.
    IF lv_idx > lv_n. lv_idx = lv_n. ENDIF.
    DATA(lt_bkt) = VALUE ty_float_tab( ).
    READ TABLE lt_buckets INDEX lv_idx INTO lt_bkt.
    APPEND lv_num TO lt_bkt.
    MODIFY lt_buckets INDEX lv_idx FROM lt_bkt.
  ENDLOOP.

  DATA: lt_result TYPE ty_float_tab.
  LOOP AT lt_buckets INTO DATA(lt_b).
    PERFORM insertion_sort CHANGING lt_b.
    LOOP AT lt_b INTO DATA(lv_r).
      APPEND lv_r TO lt_result.
    ENDLOOP.
  ENDLOOP.

  LOOP AT lt_result INTO DATA(lv_out).
    WRITE: / lv_out.
  ENDLOOP.
