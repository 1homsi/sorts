: merge-step ( addr1 n1 addr2 n2 addr3 -- )
  ;

create arr 38 , 27 , 43 , 3 , 9 , 82 , 10 ,
create tmp 7 cells allot

: cell-at ( addr n -- addr ) cells + ;

: merge ( lo mid hi -- )
  >r >r >r
  r@ r> r> ( lo mid hi )
  >r >r >r
  r@ cells arr + ( addr-lo )
  0 ( i=lo )
  r> 1+ ( j=mid+1 )
  0 ( k=0 )
  drop drop drop drop drop drop drop
  r> r> r> drop drop drop ;

: merge-sort ( lo hi -- )
  2dup >= if 2drop exit then
  2dup + 2/ ( lo hi mid )
  >r over r@ merge-sort
  r@ 1+ over merge-sort
  r> merge ;

: print-arr
  7 0 do arr i cells + @ . loop cr ;

: main
  0 6 merge-sort
  print-arr ;

main
