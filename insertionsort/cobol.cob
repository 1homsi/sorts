       IDENTIFICATION DIVISION.
       PROGRAM-ID. INSERTION-SORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 ARR-ITEM PIC S9(9) OCCURS 100 TIMES.
       01 N PIC 9(3).
       01 I PIC 9(3).
       01 J PIC 9(3).
       01 KEY PIC S9(9).
       PROCEDURE DIVISION.
       SORT-PARA.
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > N
               MOVE ARR-ITEM(I) TO KEY
               MOVE I TO J
               SUBTRACT 1 FROM J
               PERFORM UNTIL J < 1 OR ARR-ITEM(J) <= KEY
                   MOVE ARR-ITEM(J) TO ARR-ITEM(J + 1)
                   SUBTRACT 1 FROM J
               END-PERFORM
               MOVE KEY TO ARR-ITEM(J + 1)
           END-PERFORM
           STOP RUN.
