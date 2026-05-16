$ GNOME_SORT: SUBROUTINE
$   I = 1
$   N = 10
$   LOOP:
$       IF I .GT. N THEN GOTO DONE
$       IF I .EQ. 1 .OR. ARR_'I' .GE. ARR_'I-1'
$       THEN
$           I = I + 1
$       ELSE
$           TMP = ARR_'I'
$           ARR_'I' = ARR_'I-1'
$           ARR_'I-1' = TMP
$           I = I - 1
$       ENDIF
$       GOTO LOOP
$   DONE:
$ ENDSUBROUTINE
