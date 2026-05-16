       IDENTIFICATION DIVISION.
       PROGRAM-ID. BOGOSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 8 TIMES PIC S9(4) COMP.
       01 N PIC 9 VALUE 8.
       01 I PIC 9.
       01 J PIC 9.
       01 TMP PIC S9(4) COMP.
       01 SORTED PIC 9 VALUE 0.
       01 RND PIC 9V9(8).
       PROCEDURE DIVISION.
       MAIN.
           MOVE 3 TO A(1)
           MOVE 1 TO A(2)
           MOVE 4 TO A(3)
           MOVE 1 TO A(4)
           MOVE 5 TO A(5)
           MOVE 9 TO A(6)
           MOVE 2 TO A(7)
           MOVE 6 TO A(8)
       SORT-LOOP.
           PERFORM CHECK-SORTED
           IF SORTED = 1 GO TO PRINT-RESULT
           PERFORM SHUFFLE
           GO TO SORT-LOOP.
       CHECK-SORTED.
           MOVE 1 TO SORTED
           PERFORM VARYING I FROM 1 BY 1 UNTIL I >= N
               IF A(I) > A(I + 1)
                   MOVE 0 TO SORTED
               END-IF
           END-PERFORM.
       SHUFFLE.
           PERFORM VARYING I FROM N BY -1 UNTIL I <= 1
               COMPUTE RND = FUNCTION RANDOM * I
               COMPUTE J = FUNCTION INTEGER(RND) + 1
               MOVE A(I) TO TMP
               MOVE A(J) TO A(I)
               MOVE TMP TO A(J)
           END-PERFORM.
       PRINT-RESULT.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY A(I)
           END-PERFORM
           STOP RUN.
