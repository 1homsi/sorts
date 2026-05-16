: insertion-sort ( addr n -- )
  1 DO
    I CELLS OVER + @
    I 1-
    BEGIN
      DUP 0 >=
      OVER CELLS 3 PICK + @ ROT > AND
    WHILE
      DUP CELLS 3 PICK + @
      OVER 1+ CELLS 3 PICK + !
      1-
    REPEAT
    1+ CELLS OVER + !
  LOOP
  DROP ;
