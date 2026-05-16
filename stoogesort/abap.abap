REPORT ZSTOOGE.

DATA: arr TYPE TABLE OF i WITH HEADER LINE,
      tmp TYPE i,
      t   TYPE i,
      n   TYPE i.

FORM stooge_sort USING first TYPE i last TYPE i.
    READ TABLE arr INDEX first + 1 INTO DATA(a).
    READ TABLE arr INDEX last + 1 INTO DATA(b).
    IF a > b.
        MODIFY arr FROM b INDEX first + 1.
        MODIFY arr FROM a INDEX last + 1.
    ENDIF.
    n = last - first + 1.
    IF n > 2.
        t = n * 2 / 3.
        PERFORM stooge_sort USING first first + t - 1.
        PERFORM stooge_sort USING last - t + 1 last.
        PERFORM stooge_sort USING first first + t - 1.
    ENDIF.
ENDFORM.

START-OF-SELECTION.
    APPEND 3 TO arr.
    APPEND 1 TO arr.
    APPEND 4 TO arr.
    APPEND 1 TO arr.
    APPEND 5 TO arr.
    APPEND 9 TO arr.
    APPEND 2 TO arr.
    APPEND 6 TO arr.
    PERFORM stooge_sort USING 0 7.
    LOOP AT arr.
        WRITE: / arr.
    ENDLOOP.
