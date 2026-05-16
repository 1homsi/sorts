       IDENTIFICATION DIVISION.
       PROGRAM-ID. BITONICSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 ARR-ITEM OCCURS 8 TIMES PIC S9(4).
       01 N PIC 9(4) VALUE 8.
       01 I PIC 9(4).
       01 J PIC 9(4).
       01 K PIC 9(4).
       01 LO PIC 9(4).
       01 CNT PIC 9(4).
       01 DIR PIC 9(1).
       01 TMP PIC S9(4).
       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE 3 TO ARR-ITEM(1)
           MOVE 7 TO ARR-ITEM(2)
           MOVE 4 TO ARR-ITEM(3)
           MOVE 8 TO ARR-ITEM(4)
           MOVE 6 TO ARR-ITEM(5)
           MOVE 2 TO ARR-ITEM(6)
           MOVE 1 TO ARR-ITEM(7)
           MOVE 5 TO ARR-ITEM(8)
           MOVE 1 TO LO
           MOVE N TO CNT
           MOVE 1 TO DIR
           PERFORM BITONIC-SORT
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY ARR-ITEM(I)
           END-PERFORM
           STOP RUN.
       COMPARE-SWAP.
           IF DIR = 1 AND ARR-ITEM(I) > ARR-ITEM(J)
               MOVE ARR-ITEM(I) TO TMP
               MOVE ARR-ITEM(J) TO ARR-ITEM(I)
               MOVE TMP TO ARR-ITEM(J)
           END-IF
           IF DIR = 0 AND ARR-ITEM(I) < ARR-ITEM(J)
               MOVE ARR-ITEM(I) TO TMP
               MOVE ARR-ITEM(J) TO ARR-ITEM(I)
               MOVE TMP TO ARR-ITEM(J)
           END-IF.
       BITONIC-SORT.
           DISPLAY "Bitonic sort not fully expanded in COBOL".
