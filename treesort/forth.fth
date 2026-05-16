variable node-count
create node-vals 300 cells allot
create node-lefts 300 cells allot
create node-rights 300 cells allot

: node-val-addr ( idx -- addr ) cells node-vals + ;
: node-left-addr ( idx -- addr ) cells node-lefts + ;
: node-right-addr ( idx -- addr ) cells node-rights + ;

: new-node ( val -- idx )
    node-count @ 1 + dup node-count !
    over over node-val-addr !
    dup node-left-addr 0 swap !
    dup node-right-addr 0 swap !
    nip
;

: (insert) ( idx-addr val -- )
    over @ 0= if
        new-node swap !
    else
        over @ node-val-addr @ 2dup < if
            drop over @ node-left-addr swap recurse
        else
            2drop over @ node-right-addr swap recurse
        then
    then
;

create result-arr 100 cells allot
variable result-cnt

: (inorder) ( idx -- )
    dup 0= if drop exit then
    dup node-left-addr @ recurse
    dup node-val-addr @ result-cnt @ cells result-arr + !
    result-cnt @ 1 + result-cnt !
    node-right-addr @ recurse
;

create input-arr 5 , 3 , 7 , 1 , 4 , 6 , 8 ,
variable tree-root

: treesort
    0 node-count !
    0 result-cnt !
    0 tree-root !
    7 0 do
        i cells input-arr + @ tree-root (insert)
    loop
    tree-root @ (inorder)
    result-cnt @ 0 do
        i cells result-arr + @ . space
    loop cr
;

treesort
