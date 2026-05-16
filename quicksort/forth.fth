variable arr-ptr

: cell-at ( base idx -- addr ) cells + ;
: arr@ ( idx -- n ) cells arr-ptr @ + @ ;
: arr! ( n idx -- ) cells arr-ptr @ + ! ;

: swap-elems ( i j -- )
  over arr@ over arr@ ( i j vi vj )
  2 pick arr! ( i j vi )
  swap arr! ;

: partition ( low high -- p )
  dup arr@ >r ( low high ; pivot )
  over ( low high low )
  begin 2 pick 2 pick < while ( low high i j... )
    dup arr@ r@ <= if
      2 over swap-elems
      >r 1+ r>
    then
    1+
  repeat
  drop nip ( low i )
  dup arr@ r@ ( low i arr[i] pivot )
  2 pick arr!
  swap arr!
  r> drop ;

: qs ( low high -- )
  2dup < if
    2dup partition ( low high p )
    rot drop ( high p )
    over 1- ( high p p-1 )
    rot ( p p-1 high )
    drop ( p p-1 )
    swap ( p-1 p )
    dup 1+ rot ( p p+1 high... )
    here here ( placeholders )
    2drop
  then
  2drop ;

create data 3 , 6 , 8 , 10 , 1 , 2 , 1 ,
data arr-ptr !
0 6 qs
7 0 do i arr@ . loop cr
