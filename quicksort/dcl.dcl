$ ! DCL Quicksort
$ arr_0 = 3
$ arr_1 = 6
$ arr_2 = 8
$ arr_3 = 10
$ arr_4 = 1
$ arr_5 = 2
$ arr_6 = 1
$ n = 7
$ GOSUB QUICKSORT_INIT
$ EXIT

$ QUICKSORT_INIT:
$ ! Iterative using stack simulation
$ sp = 0
$ stack_low_'sp' = 0
$ stack_high_'sp' = 6
$ LOOP:
$   IF sp .lt. 0 THEN GOTO LOOP_END
$   low = stack_low_'sp'
$   high = stack_high_'sp'
$   sp = sp - 1
$   IF low .ge. high THEN GOTO LOOP
$   pivot_idx = high
$   pivot_val = arr_'pivot_idx'
$   i = low
$   j = low
$   INNER:
$     IF j .ge. high THEN GOTO INNER_END
$     val = arr_'j'
$     IF val .gt. pivot_val THEN GOTO SKIP
$       tmp = arr_'i'
$       arr_'i' = val
$       arr_'j' = tmp
$       i = i + 1
$   SKIP:
$     j = j + 1
$     GOTO INNER
$   INNER_END:
$   tmp = arr_'i'
$   arr_'i' = arr_'high'
$   arr_'high' = tmp
$   sp = sp + 1
$   stack_low_'sp' = low
$   stack_high_'sp' = i - 1
$   sp = sp + 1
$   stack_low_'sp' = i + 1
$   stack_high_'sp' = high
$   GOTO LOOP
$ LOOP_END:
$ i = 0
$ OUTPUT_LOOP:
$   IF i .ge. n THEN RETURN
$   WRITE SYS$OUTPUT arr_'i'
$   i = i + 1
$   GOTO OUTPUT_LOOP
