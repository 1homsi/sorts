       IDENTIFICATION DIVISION.
       PROGRAM-ID. SHELLSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 7 TIMES PIC S9(4).
       01 N PIC 9(4) VALUE 7.
       01 GAP PIC 9(4).
       01 I PIC 9(4).
       01 J PIC 9(4).
       01 TEMP PIC S9(4).
       PROCEDURE DIVISION.
           MOVE 64 TO A(1)
           MOVE 34 TO A(2)
           MOVE 25 TO A(3)
           MOVE 12 TO A(4)
           MOVE 22 TO A(5)
           MOVE 11 TO A(6)
           MOVE 90 TO A(7)
           COMPUTE GAP = N / 2
           PERFORM UNTIL GAP = 0
               PERFORM VARYING I FROM GAP + 1 BY 1 UNTIL I > N
                   MOVE A(I) TO TEMP
                   MOVE I TO J
                   PERFORM UNTIL J < GAP + 1 OR A(J - GAP) <= TEMP
                       MOVE A(J - GAP) TO A(J)
                       SUBTRACT GAP FROM J
                   END-PERFORM
                   MOVE TEMP TO A(J)
               END-PERFORM
               COMPUTE GAP = GAP / 2
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY A(I)
           END-PERFORM
           STOP RUN.
