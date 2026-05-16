REPORT cycle_sort.

DATA: arr TYPE TABLE OF i,
      n TYPE i,
      cycle_start TYPE i,
      item TYPE i,
      pos TYPE i,
      idx TYPE i,
      tmp TYPE i,
      writes TYPE i,
      val TYPE i.

APPEND 5 TO arr.
APPEND 4 TO arr.
APPEND 3 TO arr.
APPEND 2 TO arr.
APPEND 1 TO arr.

n = lines( arr ).
writes = 0.

DO n - 1 TIMES.
  cycle_start = sy-index.
  READ TABLE arr INTO item INDEX cycle_start.
  pos = cycle_start.
  idx = cycle_start + 1.
  WHILE idx <= n.
    READ TABLE arr INTO val INDEX idx.
    IF val < item.
      pos = pos + 1.
    ENDIF.
    idx = idx + 1.
  ENDWHILE.
  IF pos <> cycle_start.
    READ TABLE arr INTO val INDEX pos.
    WHILE val = item.
      pos = pos + 1.
      READ TABLE arr INTO val INDEX pos.
    ENDWHILE.
    READ TABLE arr INTO tmp INDEX pos.
    MODIFY arr FROM item INDEX pos.
    item = tmp.
    writes = writes + 1.
    WHILE pos <> cycle_start.
      pos = cycle_start.
      idx = cycle_start + 1.
      WHILE idx <= n.
        READ TABLE arr INTO val INDEX idx.
        IF val < item.
          pos = pos + 1.
        ENDIF.
        idx = idx + 1.
      ENDWHILE.
      READ TABLE arr INTO val INDEX pos.
      WHILE val = item.
        pos = pos + 1.
        READ TABLE arr INTO val INDEX pos.
      ENDWHILE.
      READ TABLE arr INTO tmp INDEX pos.
      MODIFY arr FROM item INDEX pos.
      item = tmp.
      writes = writes + 1.
    ENDWHILE.
  ENDIF.
ENDDO.

LOOP AT arr INTO val.
  WRITE: val, ' '.
ENDLOOP.
