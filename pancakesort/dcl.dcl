$ arr[0] = 3
$ arr[1] = 6
$ arr[2] = 2
$ arr[3] = 7
$ arr[4] = 4
$ arr[5] = 1
$ arr[6] = 5
$ n = 7
$ size = n
$OUTER_LOOP:
$ IF size .LE. 1 THEN GOTO DONE
$ max_idx = 0
$ i = 1
$FIND_MAX:
$ IF i .GE. size THEN GOTO DO_FLIP
$ IF arr[i] .GT. arr[max_idx] THEN max_idx = i
$ i = i + 1
$ GOTO FIND_MAX
$DO_FLIP:
$ IF max_idx .EQ. size - 1 THEN GOTO NEXT
$ IF max_idx .EQ. 0 THEN GOTO SKIP_FIRST
$ left = 0
$ right = max_idx
$FLIP1:
$ IF left .GE. right THEN GOTO SKIP_FIRST
$ tmp = arr[left]
$ arr[left] = arr[right]
$ arr[right] = tmp
$ left = left + 1
$ right = right - 1
$ GOTO FLIP1
$SKIP_FIRST:
$ left = 0
$ right = size - 1
$FLIP2:
$ IF left .GE. right THEN GOTO NEXT
$ tmp = arr[left]
$ arr[left] = arr[right]
$ arr[right] = tmp
$ left = left + 1
$ right = right - 1
$ GOTO FLIP2
$NEXT:
$ size = size - 1
$ GOTO OUTER_LOOP
$DONE:
$ i = 0
$PRINT:
$ IF i .GE. n THEN EXIT
$ WRITE SYS$OUTPUT arr[i]
$ i = i + 1
$ GOTO PRINT
