       IDENTIFICATION DIVISION.
       PROGRAM-ID. QUICKSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 7 TIMES PIC S9(5) VALUE 0.
       01 N PIC 9(3) VALUE 7.
       01 LOW PIC 9(3).
       01 HIGH PIC 9(3).
       01 PIVOT PIC S9(5).
       01 I PIC 9(3).
       01 J PIC 9(3).
       01 TMP PIC S9(5).
       01 STACK-LOW OCCURS 50 TIMES PIC 9(3).
       01 STACK-HIGH OCCURS 50 TIMES PIC 9(3).
       01 SP PIC 9(3) VALUE 0.
       PROCEDURE DIVISION.
           MOVE 3  TO A(1)
           MOVE 6  TO A(2)
           MOVE 8  TO A(3)
           MOVE 10 TO A(4)
           MOVE 1  TO A(5)
           MOVE 2  TO A(6)
           MOVE 1  TO A(7)
           ADD 1 TO SP
           MOVE 1 TO STACK-LOW(SP)
           MOVE N TO STACK-HIGH(SP)
           PERFORM UNTIL SP = 0
               MOVE STACK-LOW(SP) TO LOW
               MOVE STACK-HIGH(SP) TO HIGH
               SUBTRACT 1 FROM SP
               IF LOW < HIGH
                   MOVE A(HIGH) TO PIVOT
                   MOVE LOW TO I
                   PERFORM VARYING J FROM LOW BY 1 UNTIL J >= HIGH
                       IF A(J) <= PIVOT
                           MOVE A(I) TO TMP
                           MOVE A(J) TO A(I)
                           MOVE TMP TO A(J)
                           ADD 1 TO I
                       END-IF
                   END-PERFORM
                   MOVE A(I) TO TMP
                   MOVE A(HIGH) TO A(I)
                   MOVE TMP TO A(HIGH)
                   ADD 1 TO SP
                   MOVE LOW TO STACK-LOW(SP)
                   COMPUTE STACK-HIGH(SP) = I - 1
                   ADD 1 TO SP
                   COMPUTE STACK-LOW(SP) = I + 1
                   MOVE HIGH TO STACK-HIGH(SP)
               END-IF
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY A(I)
           END-PERFORM
           STOP RUN.
