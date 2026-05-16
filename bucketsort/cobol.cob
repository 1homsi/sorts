       IDENTIFICATION DIVISION.
       PROGRAM-ID. BUCKETSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 ELEM OCCURS 10 TIMES PIC 9V99.
       01 BUCKET-DATA.
          05 BUCKET OCCURS 10 TIMES.
             10 BELEM OCCURS 10 TIMES PIC 9V99.
             10 BCOUNT PIC 99 VALUE 0.
       01 N PIC 99 VALUE 10.
       01 MIN-V PIC 9V99.
       01 MAX-V PIC 9V99.
       01 IDX PIC 99.
       01 I PIC 99.
       01 J PIC 99.
       01 B PIC 99.
       01 POS PIC 99.
       01 KEY-V PIC 9V99.
       01 RANGE-V PIC 9V99.
       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE 0.78 TO ELEM(1)
           MOVE 0.17 TO ELEM(2)
           MOVE 0.39 TO ELEM(3)
           MOVE 0.26 TO ELEM(4)
           MOVE 0.72 TO ELEM(5)
           MOVE 0.94 TO ELEM(6)
           MOVE 0.21 TO ELEM(7)
           MOVE 0.12 TO ELEM(8)
           MOVE 0.23 TO ELEM(9)
           MOVE 0.68 TO ELEM(10)
           PERFORM BUCKET-SORT-PARA
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY ELEM(I)
           END-PERFORM
           STOP RUN.
       BUCKET-SORT-PARA.
           MOVE ELEM(1) TO MIN-V
           MOVE ELEM(1) TO MAX-V
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               IF ELEM(I) < MIN-V THEN MOVE ELEM(I) TO MIN-V END-IF
               IF ELEM(I) > MAX-V THEN MOVE ELEM(I) TO MAX-V END-IF
           END-PERFORM
           COMPUTE RANGE-V = MAX-V - MIN-V + 1
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               COMPUTE IDX = FUNCTION INTEGER((ELEM(I) - MIN-V) /
                   RANGE-V * N) + 1
               IF IDX > N THEN MOVE N TO IDX END-IF
               ADD 1 TO BCOUNT(IDX)
               MOVE ELEM(I) TO BELEM(IDX BCOUNT(IDX))
           END-PERFORM
           MOVE 1 TO POS
           PERFORM VARYING B FROM 1 BY 1 UNTIL B > N
               PERFORM INSERTION-SORT-PARA
               PERFORM VARYING I FROM 1 BY 1 UNTIL I > BCOUNT(B)
                   MOVE BELEM(B I) TO ELEM(POS)
                   ADD 1 TO POS
               END-PERFORM
           END-PERFORM.
       INSERTION-SORT-PARA.
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > BCOUNT(B)
               MOVE BELEM(B I) TO KEY-V
               SUBTRACT 1 FROM I GIVING J
               PERFORM UNTIL J < 1 OR BELEM(B J) <= KEY-V
                   MOVE BELEM(B J) TO BELEM(B J+1) (J + 1)
                   SUBTRACT 1 FROM J
               END-PERFORM
               MOVE KEY-V TO BELEM(B J+1) (J + 1)
           END-PERFORM.
