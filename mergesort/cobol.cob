       IDENTIFICATION DIVISION.
       PROGRAM-ID. MERGESORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 7 TIMES PIC S9(5).
       01 TMP.
          05 T OCCURS 7 TIMES PIC S9(5).
       01 LO PIC 9(3).
       01 HI PIC 9(3).
       01 MID PIC 9(3).
       01 I PIC 9(3).
       01 J PIC 9(3).
       01 K PIC 9(3).
       PROCEDURE DIVISION.
       MAIN.
           MOVE 38 TO A(1)
           MOVE 27 TO A(2)
           MOVE 43 TO A(3)
           MOVE 3  TO A(4)
           MOVE 9  TO A(5)
           MOVE 82 TO A(6)
           MOVE 10 TO A(7)
           MOVE 1 TO LO
           MOVE 7 TO HI
           PERFORM MERGE-SORT
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 7
               DISPLAY A(I)
           END-PERFORM
           STOP RUN.
       MERGE-SORT.
           IF LO >= HI STOP RUN END-IF
           COMPUTE MID = (LO + HI) / 2
           PERFORM MERGE-SORT
           PERFORM MERGE-HALVES.
       MERGE-HALVES.
           MOVE LO TO I
           ADD 1 TO MID GIVING J
           MOVE LO TO K
           PERFORM UNTIL I > MID OR J > HI
               IF A(I) <= A(J)
                   MOVE A(I) TO T(K)
                   ADD 1 TO I
               ELSE
                   MOVE A(J) TO T(K)
                   ADD 1 TO J
               END-IF
               ADD 1 TO K
           END-PERFORM
           PERFORM UNTIL I > MID
               MOVE A(I) TO T(K)
               ADD 1 TO I
               ADD 1 TO K
           END-PERFORM
           PERFORM UNTIL J > HI
               MOVE A(J) TO T(K)
               ADD 1 TO J
               ADD 1 TO K
           END-PERFORM
           PERFORM VARYING I FROM LO BY 1 UNTIL I > HI
               MOVE T(I) TO A(I)
           END-PERFORM.
