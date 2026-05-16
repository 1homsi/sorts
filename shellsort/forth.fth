7 CONSTANT SIZE
CREATE ARR 64 , 34 , 25 , 12 , 22 , 11 , 90 ,

: @IDX ( idx -- val ) CELLS ARR + @ ;
: !IDX ( val idx -- ) CELLS ARR + ! ;

: SHELL-SORT ( -- )
  SIZE 2 / ( gap )
  BEGIN DUP 0 > WHILE
    DUP SIZE 1 - ( gap gap n-1 )
    SWAP ( gap n-1 gap )
    1 PICK ( gap n-1 gap gap=i_start )
    DO ( gap )
      I @IDX ( gap temp )
      I ( gap temp j )
      BEGIN
        DUP 2 PICK >= ( gap temp j j>=gap? )
        OVER 2 PICK - @IDX ( gap temp j arr[j-gap] )
        3 PICK > AND ( gap temp j cond )
      WHILE
        OVER 2 PICK - @IDX ( gap temp j arr[j-gap] )
        OVER !IDX ( gap temp j )
        2 PICK - ( gap temp j-gap )
      REPEAT
      OVER !IDX ( gap )
      DROP
    LOOP
    2 /
  REPEAT
  DROP ;

: PRINT-ARR
  SIZE 0 DO I @IDX . LOOP CR ;

SHELL-SORT
PRINT-ARR
