REPORT heapsort.

DATA: arr TYPE TABLE OF i WITH HEADER LINE,
      n   TYPE i,
      tmp TYPE i.

FORM heapify USING a TYPE ANY TABLE sz TYPE i idx TYPE i.
  DATA: largest TYPE i, left TYPE i, right TYPE i, t TYPE i.
  DATA: va TYPE i, vl TYPE i, vr TYPE i, vlargest TYPE i.
  largest = idx.
  left = 2 * idx + 1.
  right = 2 * idx + 2.
  READ TABLE a INDEX left + 1 INTO vl.
  READ TABLE a INDEX largest + 1 INTO vlargest.
  IF left < sz AND vl > vlargest.
    largest = left.
  ENDIF.
  READ TABLE a INDEX right + 1 INTO vr.
  READ TABLE a INDEX largest + 1 INTO vlargest.
  IF right < sz AND vr > vlargest.
    largest = right.
  ENDIF.
  IF largest <> idx.
    READ TABLE a INDEX idx + 1 INTO t.
    READ TABLE a INDEX largest + 1 INTO va.
    MODIFY a INDEX idx + 1 FROM va.
    MODIFY a INDEX largest + 1 FROM t.
    PERFORM heapify USING a sz largest.
  ENDIF.
ENDFORM.

START-OF-SELECTION.
  APPEND 12 TO arr. APPEND 11 TO arr. APPEND 13 TO arr.
  APPEND 5 TO arr. APPEND 6 TO arr. APPEND 7 TO arr.
  n = 6.
  DATA i TYPE i.
  i = n / 2 - 1.
  WHILE i >= 0.
    PERFORM heapify USING arr n i.
    i = i - 1.
  ENDWHILE.
  i = n - 1.
  WHILE i > 0.
    READ TABLE arr INDEX 1 INTO tmp.
    DATA vi TYPE i.
    READ TABLE arr INDEX i + 1 INTO vi.
    MODIFY arr INDEX 1 FROM vi.
    MODIFY arr INDEX i + 1 FROM tmp.
    PERFORM heapify USING arr i 0.
    i = i - 1.
  ENDWHILE.
  LOOP AT arr.
    WRITE: / arr.
  ENDLOOP.
