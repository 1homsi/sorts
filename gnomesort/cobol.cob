       IDENTIFICATION DIVISION.
       PROGRAM-ID. GNOMESORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 ARR-ELEM OCCURS 100 TIMES PIC S9(9).
       01 N PIC 9(4) VALUE 0.
       01 I PIC 9(4) VALUE 1.
       01 TEMP PIC S9(9).
       PROCEDURE DIVISION.
       SORT-PARA.
           MOVE 1 TO I
           PERFORM UNTIL I > N
               IF I = 1 OR ARR-ELEM(I) >= ARR-ELEM(I - 1)
                   ADD 1 TO I
               ELSE
                   MOVE ARR-ELEM(I) TO TEMP
                   MOVE ARR-ELEM(I - 1) TO ARR-ELEM(I)
                   MOVE TEMP TO ARR-ELEM(I - 1)
                   SUBTRACT 1 FROM I
               END-IF
           END-PERFORM
           STOP RUN.
