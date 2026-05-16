7 CONSTANT SIZE
CREATE ARR 64 , 34 , 25 , 12 , 22 , 11 , 90 ,

: CELL-AT ( idx -- addr ) CELLS ARR + ;
: GET ( idx -- val ) CELL-AT @ ;
: PUT ( val idx -- ) CELL-AT ! ;

: SHELL-SORT
    SIZE 2 / ( gap )
    BEGIN DUP 0> WHILE
        DUP ( gap gap )
        BEGIN DUP SIZE < WHILE
            DUP GET ( gap i temp )
            OVER ( gap i temp j=i )
            BEGIN
                DUP ROT ( i temp j gap )
                OVER OVER > IF ( i temp j gap j>=gap )
                    OVER OVER - GET ( i temp j gap arr[j-gap] )
                    2 PICK > IF ( i temp j gap )
                        SWAP OVER OVER - GET ( i temp gap j arr[j-gap] )
                        3 PICK PUT ( i temp gap )
                        SWAP - ( i temp j-gap )
                        ROT ROT
                        FALSE
                    ELSE
                        DROP DROP FALSE
                    THEN
                ELSE
                    DROP DROP FALSE
                THEN
            UNTIL
            SWAP PUT
            1+
        REPEAT
        DROP
        2 /
    REPEAT
    DROP ;

: PRINT-ARR
    SIZE 0 DO
        I GET . SPACE
    LOOP CR ;

SHELL-SORT
PRINT-ARR
