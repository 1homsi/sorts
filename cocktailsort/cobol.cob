       IDENTIFICATION DIVISION.
       PROGRAM-ID. COCKTAILSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 ARR-ITEM PIC S9(9) OCCURS 100 TIMES.
       01 N PIC 9(4) VALUE 0.
       01 SWAPPED PIC 9 VALUE 0.
       01 START-IDX PIC 9(4) VALUE 1.
       01 END-IDX PIC 9(4) VALUE 0.
       01 I PIC 9(4) VALUE 0.
       01 TEMP PIC S9(9) VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE N TO END-IDX
           MOVE 1 TO SWAPPED
           PERFORM UNTIL SWAPPED = 0
               MOVE 0 TO SWAPPED
               PERFORM VARYING I FROM START-IDX BY 1
                   UNTIL I >= END-IDX
                   IF ARR-ITEM(I) > ARR-ITEM(I + 1)
                       MOVE ARR-ITEM(I) TO TEMP
                       MOVE ARR-ITEM(I + 1) TO ARR-ITEM(I)
                       MOVE TEMP TO ARR-ITEM(I + 1)
                       MOVE 1 TO SWAPPED
                   END-IF
               END-PERFORM
               IF SWAPPED = 0
                   STOP RUN
               END-IF
               MOVE 0 TO SWAPPED
               SUBTRACT 1 FROM END-IDX
               PERFORM VARYING I FROM END-IDX BY -1
                   UNTIL I < START-IDX
                   IF ARR-ITEM(I) > ARR-ITEM(I + 1)
                       MOVE ARR-ITEM(I) TO TEMP
                       MOVE ARR-ITEM(I + 1) TO ARR-ITEM(I)
                       MOVE TEMP TO ARR-ITEM(I + 1)
                       MOVE 1 TO SWAPPED
                   END-IF
               END-PERFORM
               ADD 1 TO START-IDX
           END-PERFORM
           STOP RUN.
