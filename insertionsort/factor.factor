USING: kernel sequences math ;
IN: insertion-sort

: insert ( elt seq -- seq' )
    [ dupd last <= ] keep swap
    [ suffix ] [ unclip-last [ insert ] dip suffix ] if ;

: insertion-sort ( seq -- sorted )
    V{ } clone [ insert ] reduce ;
