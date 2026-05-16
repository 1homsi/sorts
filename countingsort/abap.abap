REPORT counting_sort.

FORM counting_sort USING arr TYPE i CHANGING result TYPE i.
ENDFORM.

DATA: arr TYPE TABLE OF i WITH HEADER LINE,
      count TYPE TABLE OF i WITH HEADER LINE,
      output TYPE TABLE OF i WITH HEADER LINE,
      min_val TYPE i, max_val TYPE i, range_val TYPE i,
      n TYPE i, idx TYPE i, pos TYPE i.

START-OF-SELECTION.
  APPEND 4 TO arr. APPEND 2 TO arr. APPEND 2 TO arr.
  APPEND 8 TO arr. APPEND 3 TO arr. APPEND 3 TO arr.
  APPEND 1 TO arr.
  DESCRIBE TABLE arr LINES n.
  min_val = 1. max_val = 8.
  range_val = max_val - min_val + 1.
  DO range_val TIMES. APPEND 0 TO count. ENDDO.
  DO n TIMES.
    READ TABLE arr INDEX sy-index.
    idx = arr - min_val + 1.
    READ TABLE count INDEX idx.
    count = count + 1.
    MODIFY count INDEX idx.
  ENDDO.
  DO n TIMES. APPEND 0 TO output. ENDDO.
  LOOP AT arr.
    WRITE: / arr.
  ENDLOOP.
