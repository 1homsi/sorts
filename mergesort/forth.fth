create arr 38 , 27 , 43 , 3 , 9 , 82 , 10 ,
create tmp 7 cells allot

: arr@ ( n -- val ) cells arr + @ ;
: arr! ( val n -- ) cells arr + ! ;
: tmp@ ( n -- val ) cells tmp + @ ;
: tmp! ( val n -- ) cells tmp + ! ;

: merge ( lo mid hi -- )
  locals| hi mid lo |
  lo mid lo
  begin
    2dup <= swap 3 pick <= and
  while
    2dup arr@ 3 pick 1 + arr@ <= if
      2dup arr@ 2 pick tmp!
      rot 1 + rot rot
    else
      3 pick 1 + arr@ 2 pick tmp!
      rot rot 1 + rot
    end
    rot 1 + rot rot
  repeat
  2drop drop
  lo to hi do i arr@ i tmp! loop ;

: mergesort ( lo hi -- )
  2dup >= if 2drop exit then
  2dup + 2/ >r
  over r@ recurse
  r@ 1 + over recurse
  r> merge ;

: .arr 7 0 do i arr@ . loop cr ;

7 0 do i arr@ . loop cr
0 6 mergesort
.arr
