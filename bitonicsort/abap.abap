REPORT bitonic_sort.

DATA: arr TYPE TABLE OF i WITH HEADER LINE,
      tmp TYPE i,
      lo  TYPE i,
      cnt TYPE i,
      dir TYPE i.

FORM compare_and_swap USING pi pj pd CHANGING ptab TYPE ANY TABLE.
  DATA: ai TYPE i, aj TYPE i, ptmp TYPE i.
  READ TABLE ptab INDEX pi INTO ai.
  READ TABLE ptab INDEX pj INTO aj.
  IF ( pd = 1 AND ai > aj ) OR ( pd = 0 AND ai < aj ).
    MODIFY ptab INDEX pi FROM aj.
    MODIFY ptab INDEX pj FROM ai.
  ENDIF.
ENDFORM.

FORM bitonic_merge USING plo pcnt pdir CHANGING ptab TYPE ANY TABLE.
  DATA: k TYPE i, i TYPE i.
  IF pcnt > 1.
    k = pcnt DIV 2.
    i = plo.
    WHILE i < plo + k.
      PERFORM compare_and_swap USING i i + k pdir CHANGING ptab.
      i = i + 1.
    ENDWHILE.
    PERFORM bitonic_merge USING plo k pdir CHANGING ptab.
    PERFORM bitonic_merge USING plo + k k pdir CHANGING ptab.
  ENDIF.
ENDFORM.

FORM bitonic_sort USING plo pcnt pdir CHANGING ptab TYPE ANY TABLE.
  DATA k TYPE i.
  IF pcnt > 1.
    k = pcnt DIV 2.
    PERFORM bitonic_sort USING plo k 1 CHANGING ptab.
    PERFORM bitonic_sort USING plo + k k 0 CHANGING ptab.
    PERFORM bitonic_merge USING plo pcnt pdir CHANGING ptab.
  ENDIF.
ENDFORM.

START-OF-SELECTION.
  APPEND 3 TO arr. APPEND 7 TO arr. APPEND 4 TO arr. APPEND 8 TO arr.
  APPEND 6 TO arr. APPEND 2 TO arr. APPEND 1 TO arr. APPEND 5 TO arr.
  PERFORM bitonic_sort USING 1 8 1 CHANGING arr[].
  LOOP AT arr.
    WRITE: / arr.
  ENDLOOP.
