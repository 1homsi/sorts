$ ! DCL Bucket Sort
$ arr_0 = 78
$ arr_1 = 17
$ arr_2 = 39
$ arr_3 = 26
$ arr_4 = 72
$ arr_5 = 94
$ arr_6 = 21
$ arr_7 = 12
$ arr_8 = 23
$ arr_9 = 68
$ n = 10
$ min_v = arr_0
$ max_v = arr_0
$ i = 0
$ MINMAX_LOOP:
$   v = arr_'i'
$   IF v .LT. min_v THEN min_v = v
$   IF v .GT. max_v THEN max_v = v
$   i = i + 1
$   IF i .LT. n THEN GOTO MINMAX_LOOP
$ ! Initialize bucket counts
$ i = 0
$ INIT_LOOP:
$   cnt_'i' = 0
$   i = i + 1
$   IF i .LT. n THEN GOTO INIT_LOOP
$ ! Distribute
$ i = 0
$ DIST_LOOP:
$   v = arr_'i'
$   idx = (v - min_v) * n / (max_v - min_v + 1)
$   IF idx .GE. n THEN idx = n - 1
$   c = cnt_'idx'
$   bkt_'idx'_'c' = v
$   cnt_'idx' = c + 1
$   i = i + 1
$   IF i .LT. n THEN GOTO DIST_LOOP
$ ! Sort and concatenate
$ pos = 0
$ b = 0
$ BUCKET_LOOP:
$   m = cnt_'b'
$   IF m .LE. 1 THEN GOTO NEXT_BUCKET
$   i = 1
$   INS_LOOP:
$     key = bkt_'b'_'i'
$     j = i - 1
$     INS_INNER:
$       IF j .LT. 0 THEN GOTO INS_DONE
$       curr = bkt_'b'_'j'
$       IF curr .LE. key THEN GOTO INS_DONE
$       jp1 = j + 1
$       bkt_'b'_'jp1' = curr
$       j = j - 1
$       GOTO INS_INNER
$     INS_DONE:
$       jp1 = j + 1
$       bkt_'b'_'jp1' = key
$     i = i + 1
$     IF i .LT. m THEN GOTO INS_LOOP
$   NEXT_BUCKET:
$   i = 0
$   COPY_LOOP:
$     IF i .GE. m THEN GOTO COPY_DONE
$     arr_'pos' = bkt_'b'_'i'
$     pos = pos + 1
$     i = i + 1
$     GOTO COPY_LOOP
$   COPY_DONE:
$   b = b + 1
$   IF b .LT. n THEN GOTO BUCKET_LOOP
$ i = 0
$ PRINT_LOOP:
$   WRITE SYS$OUTPUT arr_'i'
$   i = i + 1
$   IF i .LT. n THEN GOTO PRINT_LOOP
$ EXIT
