\ Tree sort in Forth using arrays for nodes
\ Node layout: [val, left, right] each cell
variable node-count
create nodes 300 cells allot

: node-val  ( idx -- addr ) 3 * cells nodes + ;
: node-left ( idx -- addr ) 3 * 1 + cells nodes + ;
: node-right( idx -- addr ) 3 * 2 + cells nodes + ;

: new-node ( val -- idx )
    node-count @ 1+ dup node-count !
    dup node-val !
    dup node-left  0 swap !
    dup node-right 0 swap !
;

: insert ( idx-addr val -- )
    over @ 0= if
        new-node swap !
    else
        over @ node-val @ 2dup < if
            drop over @ node-left swap insert
        else
            2drop over @ node-right swap insert
        then
    then
;

create result 100 cells allot
variable res-cnt

: inorder ( idx -- )
    dup 0= if drop exit then
    dup node-left @ recurse
    dup node-val @ res-cnt @ cells result + !
    res-cnt @ 1+ res-cnt !
    node-right @ recurse
;

create arr 5 , 3 , 7 , 1 , 4 , 6 , 8 ,
variable root

: treesort
    0 root !
    7 0 do
        i cells arr + @ root insert
    loop
    0 res-cnt !
    root @ inorder
    res-cnt @ 0 do
        i cells result + @ . space
    loop cr
;

treesort
