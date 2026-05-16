create arr 3 , 7 , 4 , 8 , 6 , 2 , 1 , 5 ,

: cell-addr ( idx -- addr ) cells arr + ;
: arr@ ( idx -- n ) cell-addr @ ;
: arr! ( n idx -- ) cell-addr ! ;

: swap-elems ( i j -- )
    2dup arr@ swap arr@ ( i j aj ai )
    rot arr!  ( i aj )
    swap arr! ;

: comp-swap ( i j dir -- )
    >r 2dup arr@ swap arr@  ( i j aj ai )
    > r> = if swap-elems else 2drop then ;

: bitonic-merge ( lo cnt dir -- )
    dup 1 > if
        >r over 2dup r> ( lo cnt lo cnt dir )
        over 2/ ( lo cnt lo cnt/2 dir )
        >r >r
        0 do ( lo cnt )
            2dup drop i + over i + r@ comp-swap
        loop
        r> r>
        drop ( lo cnt/2 dir )
        bitonic-merge
    else 3drop then ;

: bitonic-sort ( lo cnt dir -- )
    dup 1 > if
        >r 2dup 2dup ( lo cnt lo cnt lo cnt )
        2/ 1 bitonic-sort
        over + swap 2/ 0 bitonic-sort
        r> bitonic-merge
    else 3drop then ;

0 8 1 bitonic-sort
8 0 do arr i arr@ . loop cr
