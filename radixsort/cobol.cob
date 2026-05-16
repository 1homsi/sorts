       IDENTIFICATION DIVISION.
       PROGRAM-ID. RADIXSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 8 TIMES PIC 9(5).
       01 OUTPUT-ARR.
          05 O OCCURS 8 TIMES PIC 9(5).
       01 COUNT-ARR.
          05 C OCCURS 10 TIMES PIC 9(6).
       01 N PIC 9 VALUE 8.
       01 MAX-VAL PIC 9(5).
       01 EXP PIC 9(6).
       01 IDX PIC 9.
       01 I PIC 9.
       01 J PIC 9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE 170 TO A(1)
           MOVE 45  TO A(2)
           MOVE 75  TO A(3)
           MOVE 90  TO A(4)
           MOVE 802 TO A(5)
           MOVE 24  TO A(6)
           MOVE 2   TO A(7)
           MOVE 66  TO A(8)
           MOVE A(1) TO MAX-VAL
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > N
               IF A(I) > MAX-VAL MOVE A(I) TO MAX-VAL
           END-PERFORM
           MOVE 1 TO EXP
           PERFORM UNTIL FUNCTION INTEGER(MAX-VAL / EXP) = 0
               PERFORM COUNT-SORT-PARA
               MULTIPLY 10 BY EXP
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY A(I) SPACE
           END-PERFORM
           STOP RUN.
       COUNT-SORT-PARA.
           PERFORM VARYING J FROM 1 BY 1 UNTIL J > 10
               MOVE 0 TO C(J)
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               COMPUTE IDX = FUNCTION MOD(FUNCTION INTEGER(A(I) / EXP), 10) + 1
               ADD 1 TO C(IDX)
           END-PERFORM
           PERFORM VARYING J FROM 2 BY 1 UNTIL J > 10
               ADD C(J - 1) TO C(J)
           END-PERFORM
           PERFORM VARYING I FROM N BY -1 UNTIL I < 1
               COMPUTE IDX = FUNCTION MOD(FUNCTION INTEGER(A(I) / EXP), 10) + 1
               MOVE A(I) TO O(C(IDX))
               SUBTRACT 1 FROM C(IDX)
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               MOVE O(I) TO A(I)
           END-PERFORM.
