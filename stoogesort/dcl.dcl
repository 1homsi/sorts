$ ARRAY[0] = 3
$ ARRAY[1] = 1
$ ARRAY[2] = 4
$ ARRAY[3] = 1
$ ARRAY[4] = 5
$ ARRAY[5] = 9
$ ARRAY[6] = 2
$ ARRAY[7] = 6
$
$ FIRST = 0
$ LAST = 7
$ CALL STOOGE_SORT 'FIRST' 'LAST'
$ LOOP:
$   I = 0
$ PRINT_LOOP:
$   IF I .LE. 7
$     WRITE SYS$OUTPUT ARRAY['I']
$     I = I + 1
$     GOTO PRINT_LOOP
$   ENDIF
$ EXIT
$
$ STOOGE_SORT: SUBROUTINE
$   F = P1
$   L = P2
$   IF ARRAY['F'] .GT. ARRAY['L']
$     TMP = ARRAY['F']
$     ARRAY['F'] = ARRAY['L']
$     ARRAY['L'] = TMP
$   ENDIF
$   N = L - F + 1
$   IF N .GT. 2
$     T = N * 2 / 3
$     M1 = F + T - 1
$     M2 = L - T + 1
$     CALL STOOGE_SORT 'F' 'M1'
$     CALL STOOGE_SORT 'M2' 'L'
$     CALL STOOGE_SORT 'F' 'M1'
$   ENDIF
$ ENDSUBROUTINE
