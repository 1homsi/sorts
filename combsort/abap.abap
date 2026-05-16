REPORT comb_sort.

FORM comb_sort CHANGING arr TYPE STANDARD TABLE.
  DATA: n    TYPE i,
        gap  TYPE i,
        i    TYPE i,
        tmp  TYPE i,
        sorted TYPE abap_bool.
  DESCRIBE TABLE arr LINES n.
  gap = n.
  sorted = abap_false.
  WHILE sorted = abap_false.
    gap = CONV i( gap / 1.3 ).
    IF gap <= 1.
      gap = 1.
      sorted = abap_true.
    ENDIF.
    DO n - gap TIMES.
      i = sy-index.
      READ TABLE arr INDEX i INTO DATA(a).
      READ TABLE arr INDEX i + gap INTO DATA(b).
      IF a > b.
        MODIFY arr INDEX i FROM b.
        MODIFY arr INDEX i + gap FROM a.
        sorted = abap_false.
      ENDIF.
    ENDDO.
  ENDWHILE.
ENDFORM.
