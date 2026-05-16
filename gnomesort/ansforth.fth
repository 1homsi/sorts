CREATE DATA 5 , 3 , 8 , 1 , 9 , 2 , 7 , 4 , 6 , 0 ,

: NTH ( i -- addr ) CELLS DATA + ;
: @NTH ( i -- n ) NTH @ ;
: !NTH ( n i -- ) NTH ! ;

: GNOME-SORT ( n -- )
    0 ( n i )
    BEGIN 2DUP < WHILE
        DUP 0= IF 1+
        ELSE DUP @NTH OVER 1 - @NTH >= IF 1+
        ELSE
            DUP @NTH OVER 1 - @NTH OVER 1 - !NTH OVER !NTH
            1 -
        THEN THEN
    REPEAT 2DROP ;
