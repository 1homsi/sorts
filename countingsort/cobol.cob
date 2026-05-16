       IDENTIFICATION DIVISION.
       PROGRAM-ID. COUNTING-SORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 7 TIMES PIC S9(4) VALUE 0.
       01 COUNT-ARR.
          05 C OCCURS 100 TIMES PIC S9(4) VALUE 0.
       01 OUTPUT-ARR.
          05 O OCCURS 7 TIMES PIC S9(4) VALUE 0.
       01 MIN-VAL PIC S9(4) VALUE 0.
       01 MAX-VAL PIC S9(4) VALUE 0.
       01 RANGE-VAL PIC S9(4) VALUE 0.
       01 IDX PIC S9(4) VALUE 0.
       01 I PIC S9(4) VALUE 0.
       01 N PIC S9(4) VALUE 7.
       PROCEDURE DIVISION.
           MOVE 4 TO A(1) MOVE 2 TO A(2) MOVE 2 TO A(3)
           MOVE 8 TO A(4) MOVE 3 TO A(5) MOVE 3 TO A(6)
           MOVE 1 TO A(7)
           MOVE A(1) TO MIN-VAL MOVE A(1) TO MAX-VAL
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               IF A(I) < MIN-VAL MOVE A(I) TO MIN-VAL END-IF
               IF A(I) > MAX-VAL MOVE A(I) TO MAX-VAL END-IF
           END-PERFORM
           COMPUTE RANGE-VAL = MAX-VAL - MIN-VAL + 1
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               COMPUTE IDX = A(I) - MIN-VAL + 1
               ADD 1 TO C(IDX)
           END-PERFORM
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > RANGE-VAL
               ADD C(I - 1) TO C(I)
           END-PERFORM
           PERFORM VARYING I FROM N BY -1 UNTIL I < 1
               COMPUTE IDX = A(I) - MIN-VAL + 1
               SUBTRACT 1 FROM C(IDX)
               COMPUTE IDX = C(IDX) + 1
               MOVE A(I) TO O(IDX)
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY O(I)
           END-PERFORM
           STOP RUN.
