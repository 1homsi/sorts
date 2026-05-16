arr.1 = 3; arr.2 = 1; arr.3 = 4; arr.4 = 1
arr.5 = 5; arr.6 = 9; arr.7 = 2; arr.8 = 6
n = 8

call RANDOM 0, 1, time('s')

DO WHILE \isSorted()
  CALL doShuffle
END

DO i = 1 TO n
  SAY arr.i
END
EXIT

isSorted: PROCEDURE EXPOSE arr. n
  DO i = 1 TO n - 1
    IF arr.i > arr.(i+1) THEN RETURN 0
  END
  RETURN 1

doShuffle: PROCEDURE EXPOSE arr. n
  DO i = n TO 2 BY -1
    j = RANDOM(1, i)
    tmp = arr.i
    arr.i = arr.j
    arr.j = tmp
  END
  RETURN
