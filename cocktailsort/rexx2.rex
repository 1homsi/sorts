/* Cocktail Sort in REXX - variant 2 */
ARR.0 = 10
ARR.1 = 5; ARR.2 = 3; ARR.3 = 8; ARR.4 = 1; ARR.5 = 9
ARR.6 = 2; ARR.7 = 7; ARR.8 = 4; ARR.9 = 6; ARR.10 = 0

SWAPPED = 1
START = 1
ENDING = ARR.0

DO WHILE SWAPPED = 1
    SWAPPED = 0
    DO I = START TO ENDING - 1
        IF ARR.I > ARR.J THEN DO
            J = I + 1
            TMP = ARR.I
            ARR.I = ARR.J
            ARR.J = TMP
            SWAPPED = 1
        END
    END
    IF SWAPPED = 0 THEN LEAVE
    SWAPPED = 0
    ENDING = ENDING - 1
    DO I = ENDING - 1 TO START BY -1
        J = I + 1
        IF ARR.I > ARR.J THEN DO
            TMP = ARR.I
            ARR.I = ARR.J
            ARR.J = TMP
            SWAPPED = 1
        END
    END
    START = START + 1
END

EXIT
