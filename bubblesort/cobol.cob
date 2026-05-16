       IDENTIFICATION DIVISION.
       PROGRAM-ID. BUBBLESORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 7 TIMES PIC S9(4) VALUE 0.
       01 N PIC 99 VALUE 7.
       01 I PIC 99.
       01 TMP PIC S9(4).
       01 SWAPPED PIC 9 VALUE 0.
       PROCEDURE DIVISION.
           MOVE 64 TO A(1)
           MOVE 34 TO A(2)
           MOVE 25 TO A(3)
           MOVE 12 TO A(4)
           MOVE 22 TO A(5)
           MOVE 11 TO A(6)
           MOVE 90 TO A(7)
           PERFORM UNTIL SWAPPED = 0
               MOVE 0 TO SWAPPED
               PERFORM VARYING I FROM 1 BY 1 UNTIL I >= N
                   IF A(I) > A(I + 1)
                       MOVE A(I) TO TMP
                       MOVE A(I + 1) TO A(I)
                       MOVE TMP TO A(I + 1)
                       MOVE 1 TO SWAPPED
                   END-IF
               END-PERFORM
               SUBTRACT 1 FROM N
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 7
               DISPLAY A(I)
           END-PERFORM
           STOP RUN.
