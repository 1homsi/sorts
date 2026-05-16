USING: kernel sequences math random io prettyprint ;
IN: bogosort

: is-sorted? ( seq -- ? )
    dup rest [ <= ] 2all? ;

: bogosort ( seq -- sorted )
    [ dup is-sorted? ] [ randomize ] until ;

{ 3 1 4 1 5 9 2 6 } bogosort .
