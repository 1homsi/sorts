REPORT mergesort.

TYPES: ty_arr TYPE STANDARD TABLE OF i WITH DEFAULT KEY.

FORM merge USING left TYPE ty_arr right TYPE ty_arr
           CHANGING result TYPE ty_arr.
  DATA: lv_l TYPE i, lv_r TYPE i.
  DATA: v_l TYPE i, v_r TYPE i.
  lv_l = 1. lv_r = 1.
  WHILE lv_l <= lines(left) AND lv_r <= lines(right).
    READ TABLE left INDEX lv_l INTO v_l.
    READ TABLE right INDEX lv_r INTO v_r.
    IF v_l <= v_r.
      APPEND v_l TO result.
      lv_l = lv_l + 1.
    ELSE.
      APPEND v_r TO result.
      lv_r = lv_r + 1.
    END IF.
  ENDWHILE.
  WHILE lv_l <= lines(left).
    READ TABLE left INDEX lv_l INTO v_l.
    APPEND v_l TO result.
    lv_l = lv_l + 1.
  ENDWHILE.
  WHILE lv_r <= lines(right).
    READ TABLE right INDEX lv_r INTO v_r.
    APPEND v_r TO result.
    lv_r = lv_r + 1.
  ENDWHILE.
ENDFORM.

FORM mergesort USING arr TYPE ty_arr CHANGING sorted TYPE ty_arr.
  DATA: mid TYPE i, left TYPE ty_arr, right TYPE ty_arr.
  DATA: sl TYPE ty_arr, sr TYPE ty_arr.
  DATA: val TYPE i, idx TYPE i.
  IF lines(arr) <= 1.
    sorted = arr.
    RETURN.
  ENDIF.
  mid = lines(arr) / 2.
  LOOP AT arr INTO val.
    idx = sy-tabix.
    IF idx <= mid.
      APPEND val TO left.
    ELSE.
      APPEND val TO right.
    ENDIF.
  ENDLOOP.
  PERFORM mergesort USING left CHANGING sl.
  PERFORM mergesort USING right CHANGING sr.
  PERFORM merge USING sl sr CHANGING sorted.
ENDFORM.

START-OF-SELECTION.
  DATA: arr TYPE ty_arr, sorted TYPE ty_arr.
  APPEND 38 TO arr. APPEND 27 TO arr. APPEND 43 TO arr.
  APPEND 3 TO arr. APPEND 9 TO arr. APPEND 82 TO arr.
  APPEND 10 TO arr.
  PERFORM mergesort USING arr CHANGING sorted.
  LOOP AT sorted INTO DATA(v).
    WRITE: / v.
  ENDLOOP.
