       IDENTIFICATION DIVISION.
       PROGRAM-ID. HEAPSORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 6 TIMES PIC S9(4).
       01 N PIC 9(4) VALUE 6.
       01 I PIC 9(4).
       01 J PIC 9(4).
       01 LARGEST PIC 9(4).
       01 LEFT-IDX PIC 9(4).
       01 RIGHT-IDX PIC 9(4).
       01 TMP PIC S9(4).
       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE 12 TO A(1)
           MOVE 11 TO A(2)
           MOVE 13 TO A(3)
           MOVE 5  TO A(4)
           MOVE 6  TO A(5)
           MOVE 7  TO A(6)
           PERFORM VARYING I FROM 3 BY -1 UNTIL I < 1
               PERFORM HEAPIFY-PARA
           END-PERFORM
           PERFORM VARYING I FROM 6 BY -1 UNTIL I <= 1
               MOVE A(1) TO TMP
               MOVE A(I) TO A(1)
               MOVE TMP TO A(I)
               MOVE 1 TO J
               SUBTRACT 1 FROM I GIVING N
               PERFORM HEAPIFY-J-PARA
               ADD 1 TO I GIVING I
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 6
               DISPLAY A(I)
           END-PERFORM
           STOP RUN.
       HEAPIFY-PARA.
           MOVE I TO J
           PERFORM HEAPIFY-J-PARA.
       HEAPIFY-J-PARA.
           MOVE J TO LARGEST
           MULTIPLY 2 BY J GIVING LEFT-IDX
           ADD 1 TO LEFT-IDX GIVING RIGHT-IDX
           SUBTRACT 1 FROM LEFT-IDX
           ADD 1 TO LEFT-IDX
           IF LEFT-IDX <= N AND A(LEFT-IDX) > A(LARGEST)
               MOVE LEFT-IDX TO LARGEST
           END-IF
           IF RIGHT-IDX <= N AND A(RIGHT-IDX) > A(LARGEST)
               MOVE RIGHT-IDX TO LARGEST
           END-IF
           IF LARGEST NOT EQUAL J
               MOVE A(J) TO TMP
               MOVE A(LARGEST) TO A(J)
               MOVE TMP TO A(LARGEST)
               MOVE LARGEST TO J
               PERFORM HEAPIFY-J-PARA
           END-IF.
