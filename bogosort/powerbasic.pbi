DIM arr(1 TO 8) AS INTEGER
arr(1) = 3: arr(2) = 1: arr(3) = 4: arr(4) = 1
arr(5) = 5: arr(6) = 9: arr(7) = 2: arr(8) = 6

FUNCTION IsSorted() AS INTEGER
  DIM i AS INTEGER
  FOR i = 1 TO 7
    IF arr(i) > arr(i + 1) THEN FUNCTION = 0: EXIT FUNCTION
  NEXT i
  FUNCTION = 1
END FUNCTION

SUB Shuffle()
  DIM i AS INTEGER, j AS INTEGER, tmp AS INTEGER
  FOR i = 8 TO 2 STEP -1
    j = INT(RND * i) + 1
    tmp = arr(i): arr(i) = arr(j): arr(j) = tmp
  NEXT i
END SUB

RANDOMIZE TIMER
DO WHILE NOT IsSorted()
  Shuffle()
LOOP

DIM i AS INTEGER
FOR i = 1 TO 8
  PRINT arr(i); " ";
NEXT i
PRINT
