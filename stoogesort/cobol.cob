       IDENTIFICATION DIVISION.
       PROGRAM-ID. STOOGESORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 8 TIMES PIC S9(4) VALUE 0.
       01 FIRST    PIC 9(4) VALUE 1.
       01 LAST-IDX PIC 9(4) VALUE 8.
       01 TMP      PIC S9(4).
       01 T-VAL    PIC 9(4).
       01 N-VAL    PIC 9(4).
       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE 3 TO A(1)
           MOVE 1 TO A(2)
           MOVE 4 TO A(3)
           MOVE 1 TO A(4)
           MOVE 5 TO A(5)
           MOVE 9 TO A(6)
           MOVE 2 TO A(7)
           MOVE 6 TO A(8)
           MOVE 1 TO FIRST
           MOVE 8 TO LAST-IDX
           PERFORM STOOGE-SORT
           PERFORM VARYING FIRST FROM 1 BY 1 UNTIL FIRST > 8
               DISPLAY A(FIRST) SPACE
           END-PERFORM
           STOP RUN.
       STOOGE-SORT.
           IF A(FIRST) > A(LAST-IDX)
               MOVE A(FIRST) TO TMP
               MOVE A(LAST-IDX) TO A(FIRST)
               MOVE TMP TO A(LAST-IDX)
           END-IF
           COMPUTE N-VAL = LAST-IDX - FIRST + 1
           IF N-VAL > 2
               COMPUTE T-VAL = N-VAL * 2 / 3
           END-IF.
