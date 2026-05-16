       IDENTIFICATION DIVISION.
       PROGRAM-ID. CYCLESORT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARR.
          05 A OCCURS 5 TIMES PIC S9(4) COMP.
       01 N PIC 99 VALUE 5.
       01 CYCLE-START PIC 99.
       01 ITEM PIC S9(4) COMP.
       01 POS PIC 99.
       01 I PIC 99.
       01 TMP PIC S9(4) COMP.
       01 WRITES PIC 99 VALUE 0.
       PROCEDURE DIVISION.
           MOVE 5 TO A(1)
           MOVE 4 TO A(2)
           MOVE 3 TO A(3)
           MOVE 2 TO A(4)
           MOVE 1 TO A(5)
           PERFORM VARYING CYCLE-START FROM 1 BY 1
               UNTIL CYCLE-START >= N
               MOVE A(CYCLE-START) TO ITEM
               MOVE CYCLE-START TO POS
               PERFORM VARYING I FROM CYCLE-START BY 1
                   UNTIL I > N
                   IF I > CYCLE-START AND A(I) < ITEM
                       ADD 1 TO POS
                   END-IF
               END-PERFORM
               IF POS NOT = CYCLE-START
                   PERFORM UNTIL A(POS) NOT = ITEM
                       ADD 1 TO POS
                   END-PERFORM
                   MOVE A(POS) TO TMP
                   MOVE ITEM TO A(POS)
                   MOVE TMP TO ITEM
                   ADD 1 TO WRITES
                   PERFORM UNTIL POS = CYCLE-START
                       MOVE CYCLE-START TO POS
                       PERFORM VARYING I FROM CYCLE-START BY 1
                           UNTIL I > N
                           IF I > CYCLE-START AND A(I) < ITEM
                               ADD 1 TO POS
                           END-IF
                       END-PERFORM
                       PERFORM UNTIL A(POS) NOT = ITEM
                           ADD 1 TO POS
                       END-PERFORM
                       MOVE A(POS) TO TMP
                       MOVE ITEM TO A(POS)
                       MOVE TMP TO ITEM
                       ADD 1 TO WRITES
                   END-PERFORM
               END-IF
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY A(I)
           END-PERFORM
           STOP RUN.
