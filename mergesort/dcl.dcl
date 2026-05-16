$ SET NOON
$ ARR_0 = 38
$ ARR_1 = 27
$ ARR_2 = 43
$ ARR_3 = 3
$ ARR_4 = 9
$ ARR_5 = 82
$ ARR_6 = 10
$ N = 7
$
$ GOSUB MERGESORT_0_6
$
$ I = 0
$ PRINT_LOOP:
$     WRITE SYS$OUTPUT ARR_'I'
$     I = I + 1
$     IF I .LT. N THEN GOTO PRINT_LOOP
$ EXIT
$
$ MERGESORT_0_6:
$   ! Merge sort from index 0 to 6
$   ! (DCL does not support true recursive subroutines easily)
$   ! Implementing iterative bottom-up merge sort
$   WIDTH = 1
$ OUTER_LOOP:
$   IF WIDTH .GE. N THEN RETURN
$   LO = 0
$ INNER_LOOP:
$   IF LO .GE. N THEN GOTO NEXT_WIDTH
$   MID = LO + WIDTH - 1
$   IF MID .GE. N THEN MID = N - 1
$   HI = LO + 2 * WIDTH - 1
$   IF HI .GE. N THEN HI = N - 1
$   GOSUB DO_MERGE
$   LO = LO + 2 * WIDTH
$   GOTO INNER_LOOP
$ NEXT_WIDTH:
$   WIDTH = WIDTH * 2
$   GOTO OUTER_LOOP
$
$ DO_MERGE:
$   I = LO
$   J = MID + 1
$   K = LO
$ MERGE_LOOP:
$   IF I .GT. MID THEN GOTO MERGE_RIGHT
$   IF J .GT. HI THEN GOTO MERGE_LEFT
$   IF ARR_'I' .LE. ARR_'J' THEN GOTO TAKE_LEFT
$   TMP_'K' = ARR_'J'
$   J = J + 1
$   K = K + 1
$   GOTO MERGE_LOOP
$ TAKE_LEFT:
$   TMP_'K' = ARR_'I'
$   I = I + 1
$   K = K + 1
$   GOTO MERGE_LOOP
$ MERGE_LEFT:
$   TMP_'K' = ARR_'I'
$   I = I + 1
$   K = K + 1
$   IF I .LE. MID THEN GOTO MERGE_LEFT
$   GOTO COPY_BACK
$ MERGE_RIGHT:
$   TMP_'K' = ARR_'J'
$   J = J + 1
$   K = K + 1
$   IF J .LE. HI THEN GOTO MERGE_RIGHT
$ COPY_BACK:
$   X = LO
$ COPY_LOOP:
$   ARR_'X' = TMP_'X'
$   X = X + 1
$   IF X .LE. HI THEN GOTO COPY_LOOP
$   RETURN
