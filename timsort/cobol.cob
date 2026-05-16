       IDENTIFICATION DIVISION.
       PROGRAM-ID. TIMSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 9 TIMES PIC S9(9) VALUE 0.
       01 MIN-RUN PIC 9(9) VALUE 32.
       01 N PIC 9(9) VALUE 9.
       01 I PIC S9(9).
       01 J PIC S9(9).
       01 K PIC S9(9).
       01 KEY-VAL PIC S9(9).
       01 LEFT-IDX PIC S9(9).
       01 RIGHT-IDX PIC S9(9).
       01 MID-IDX PIC S9(9).
       01 SIZE-VAL PIC S9(9).
       01 TEMP-VAL PIC S9(9).
       01 LP OCCURS 500 TIMES PIC S9(9).
       01 RP OCCURS 500 TIMES PIC S9(9).
       01 LN PIC S9(9).
       01 RN PIC S9(9).
       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE 5 TO A(1), MOVE 2 TO A(2), MOVE 8 TO A(3)
           MOVE 1 TO A(4), MOVE 9 TO A(5), MOVE 3 TO A(6)
           MOVE 7 TO A(7), MOVE 4 TO A(8), MOVE 6 TO A(9)
           MOVE 1 TO I
           PERFORM UNTIL I > N
               COMPUTE RIGHT-IDX = I + MIN-RUN - 1
               IF RIGHT-IDX > N MOVE N TO RIGHT-IDX END-IF
               MOVE I TO LEFT-IDX
               PERFORM INSERTION-SORT-PARA
               COMPUTE I = I + MIN-RUN
           END-PERFORM
           MOVE MIN-RUN TO SIZE-VAL
           PERFORM UNTIL SIZE-VAL >= N
               MOVE 1 TO LEFT-IDX
               PERFORM UNTIL LEFT-IDX > N
                   COMPUTE MID-IDX = LEFT-IDX + SIZE-VAL - 1
                   IF MID-IDX > N MOVE N TO MID-IDX END-IF
                   COMPUTE RIGHT-IDX = LEFT-IDX + 2 * SIZE-VAL - 1
                   IF RIGHT-IDX > N MOVE N TO RIGHT-IDX END-IF
                   IF MID-IDX < RIGHT-IDX PERFORM MERGE-PARA END-IF
                   COMPUTE LEFT-IDX = LEFT-IDX + 2 * SIZE-VAL
               END-PERFORM
               COMPUTE SIZE-VAL = SIZE-VAL * 2
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY A(I) WITH NO ADVANCING
               DISPLAY ' ' WITH NO ADVANCING
           END-PERFORM
           DISPLAY ' '
           STOP RUN.
       INSERTION-SORT-PARA.
           COMPUTE I = LEFT-IDX + 1
           PERFORM UNTIL I > RIGHT-IDX
               MOVE A(I) TO KEY-VAL
               COMPUTE J = I - 1
               PERFORM UNTIL J < LEFT-IDX OR A(J) <= KEY-VAL
                   COMPUTE K = J + 1
                   MOVE A(J) TO A(K)
                   COMPUTE J = J - 1
               END-PERFORM
               COMPUTE K = J + 1
               MOVE KEY-VAL TO A(K)
               COMPUTE I = I + 1
           END-PERFORM.
       MERGE-PARA.
           COMPUTE LN = MID-IDX - LEFT-IDX + 1
           COMPUTE RN = RIGHT-IDX - MID-IDX
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LN
               COMPUTE K = LEFT-IDX + I - 1
               MOVE A(K) TO LP(I)
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > RN
               COMPUTE K = MID-IDX + I
               MOVE A(K) TO RP(I)
           END-PERFORM
           MOVE 1 TO I, MOVE 1 TO J, MOVE LEFT-IDX TO K
           PERFORM UNTIL I > LN OR J > RN
               IF LP(I) <= RP(J)
                   MOVE LP(I) TO A(K), COMPUTE I = I + 1
               ELSE
                   MOVE RP(J) TO A(K), COMPUTE J = J + 1
               END-IF
               COMPUTE K = K + 1
           END-PERFORM
           PERFORM UNTIL I > LN
               MOVE LP(I) TO A(K), COMPUTE I = I + 1, COMPUTE K = K + 1
           END-PERFORM
           PERFORM UNTIL J > RN
               MOVE RP(J) TO A(K), COMPUTE J = J + 1, COMPUTE K = K + 1
           END-PERFORM.
