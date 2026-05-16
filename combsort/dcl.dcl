$ SUBROUTINE COMB_SORT
$   N = P1
$   GAP = N
$   SORTED = 0
$   OUTER_LOOP:
$     IF SORTED .EQ. 1 THEN GOTO DONE
$     GAP = GAP * 10 / 13
$     IF GAP .LE. 1
$     THEN
$       GAP = 1
$       SORTED = 1
$     ENDIF
$     I = 1
$     INNER_LOOP:
$       J = I + GAP
$       IF J .GT. N THEN GOTO INNER_DONE
$       A = ARR_'I'
$       B = ARR_'J'
$       IF A .GT. B
$       THEN
$         ARR_'I' = B
$         ARR_'J' = A
$         SORTED = 0
$       ENDIF
$       I = I + 1
$       GOTO INNER_LOOP
$     INNER_DONE:
$     GOTO OUTER_LOOP
$   DONE:
$ ENDSUBROUTINE
