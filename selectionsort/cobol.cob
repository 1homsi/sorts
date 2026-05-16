       IDENTIFICATION DIVISION.
       PROGRAM-ID. SELECTIONSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 10 TIMES PIC S9(4).
       01 N PIC 99 VALUE 10.
       01 I PIC 99.
       01 J PIC 99.
       01 MIN-IDX PIC 99.
       01 TMP PIC S9(4).
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I >= N
               MOVE I TO MIN-IDX
               PERFORM VARYING J FROM I + 1 BY 1 UNTIL J > N
                   IF A(J) < A(MIN-IDX) THEN
                       MOVE J TO MIN-IDX
                   END-IF
               END-PERFORM
               MOVE A(I) TO TMP
               MOVE A(MIN-IDX) TO A(I)
               MOVE TMP TO A(MIN-IDX)
           END-PERFORM
           STOP RUN.
