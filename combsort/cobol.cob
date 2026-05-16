       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMBSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 ARR-ELEM OCCURS 100 TIMES PIC S9(9).
       01 N          PIC 9(4).
       01 GAP        PIC 9(4).
       01 I          PIC 9(4).
       01 TMP        PIC S9(9).
       01 SORTED     PIC 9 VALUE 0.
       01 SHRINK     PIC 9V9 VALUE 1.3.
       01 NEWGAP     PIC 9(4).
       PROCEDURE DIVISION.
       MAIN.
           MOVE N TO GAP
           MOVE 0 TO SORTED
           PERFORM UNTIL SORTED = 1
               COMPUTE NEWGAP = FUNCTION INTEGER(GAP / SHRINK)
               IF NEWGAP < 1 MOVE 1 TO NEWGAP
               MOVE NEWGAP TO GAP
               IF GAP = 1 MOVE 1 TO SORTED END-IF
               PERFORM VARYING I FROM 1 BY 1
                   UNTIL I > N - GAP
                   IF ARR-ELEM(I) > ARR-ELEM(I + GAP)
                       MOVE ARR-ELEM(I) TO TMP
                       MOVE ARR-ELEM(I + GAP) TO ARR-ELEM(I)
                       MOVE TMP TO ARR-ELEM(I + GAP)
                       MOVE 0 TO SORTED
                   END-IF
               END-PERFORM
           END-PERFORM
           STOP RUN.
