$ SELECTION_SORT: SUBROUTINE
$ N = 5
$ ARR_1 = 5
$ ARR_2 = 3
$ ARR_3 = 1
$ ARR_4 = 4
$ ARR_5 = 2
$ I = 1
$ OUTER_LOOP:
$   IF I .GE. N THEN GOTO DONE
$   MIN_IDX = I
$   J = I + 1
$   INNER_LOOP:
$     IF J .GT. N THEN GOTO SWAP
$     IF ARR_'J' .LT. ARR_'MIN_IDX' THEN MIN_IDX = J
$     J = J + 1
$     GOTO INNER_LOOP
$   SWAP:
$     TMP = ARR_'I'
$     ARR_'I' = ARR_'MIN_IDX'
$     ARR_'MIN_IDX' = TMP
$     I = I + 1
$     GOTO OUTER_LOOP
$ DONE:
$ EXIT
$ ENDSUBROUTINE
