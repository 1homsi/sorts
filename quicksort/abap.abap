REPORT quicksort_demo.

DATA: arr TYPE TABLE OF i,
      pivot TYPE i,
      tmp TYPE i,
      i TYPE i,
      j TYPE i,
      n TYPE i.

FORM partition USING low TYPE i high TYPE i CHANGING p TYPE i.
  READ TABLE arr INTO pivot INDEX high.
  i = low.
  j = low.
  WHILE j < high.
    DATA val TYPE i.
    READ TABLE arr INTO val INDEX j.
    IF val <= pivot.
      DATA val_i TYPE i.
      READ TABLE arr INTO val_i INDEX i.
      MODIFY arr FROM val INDEX i.
      MODIFY arr FROM val_i INDEX j.
      i = i + 1.
    ENDIF.
    j = j + 1.
  ENDWHILE.
  READ TABLE arr INTO val INDEX i.
  MODIFY arr FROM pivot INDEX i.
  MODIFY arr FROM val INDEX high.
  p = i.
ENDFORM.

FORM quicksort USING low TYPE i high TYPE i.
  IF low < high.
    DATA p TYPE i.
    PERFORM partition USING low high CHANGING p.
    PERFORM quicksort USING low p - 1.
    PERFORM quicksort USING p + 1 high.
  ENDIF.
ENDFORM.

START-OF-SELECTION.
  APPEND 3 TO arr.
  APPEND 6 TO arr.
  APPEND 8 TO arr.
  APPEND 10 TO arr.
  APPEND 1 TO arr.
  APPEND 2 TO arr.
  APPEND 1 TO arr.
  n = 7.
  PERFORM quicksort USING 1 n.
  LOOP AT arr INTO tmp.
    WRITE: tmp.
  ENDLOOP.
