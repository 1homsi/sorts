       IDENTIFICATION DIVISION.
       PROGRAM-ID. PANCAKESORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 7 TIMES PIC S9(4) COMP.
       01 N PIC 99 VALUE 7.
       01 SIZE PIC 99.
       01 I PIC 99.
       01 MAX-IDX PIC 99.
       01 LEFT-IDX PIC 99.
       01 RIGHT-IDX PIC 99.
       01 TMP PIC S9(4) COMP.
       PROCEDURE DIVISION.
           MOVE 3 TO A(1)
           MOVE 6 TO A(2)
           MOVE 2 TO A(3)
           MOVE 7 TO A(4)
           MOVE 4 TO A(5)
           MOVE 1 TO A(6)
           MOVE 5 TO A(7)
           PERFORM VARYING SIZE FROM N BY -1 UNTIL SIZE <= 1
               MOVE 1 TO MAX-IDX
               PERFORM VARYING I FROM 2 BY 1 UNTIL I > SIZE
                   IF A(I) > A(MAX-IDX)
                       MOVE I TO MAX-IDX
                   END-IF
               END-PERFORM
               IF MAX-IDX NOT = SIZE
                   IF MAX-IDX NOT = 1
                       PERFORM FLIP-ARRAY
                   END-IF
                   MOVE SIZE TO MAX-IDX
                   PERFORM FLIP-ARRAY
               END-IF
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY A(I)
           END-PERFORM
           STOP RUN.
       FLIP-ARRAY.
           MOVE 1 TO LEFT-IDX
           MOVE MAX-IDX TO RIGHT-IDX
           PERFORM UNTIL LEFT-IDX >= RIGHT-IDX
               MOVE A(LEFT-IDX) TO TMP
               MOVE A(RIGHT-IDX) TO A(LEFT-IDX)
               MOVE TMP TO A(RIGHT-IDX)
               ADD 1 TO LEFT-IDX
               SUBTRACT 1 FROM RIGHT-IDX
           END-PERFORM.
