USING: kernel sequences math io ;
IN: treesort

TUPLE: node val left right ;
C: <node> node

: insert ( tree val -- tree )
    over f = [
        nip f f <node>
    ] [
        2dup [ val>> ] dip < [
            [ left>> ] dip insert >>left
        ] [
            [ right>> ] dip insert >>right
        ] if
    ] if ;

: inorder ( tree -- seq )
    dup f = [ drop { } ] [
        [ left>> inorder ]
        [ val>> 1array ]
        [ right>> inorder ]
        tri append append
    ] if ;

: treesort ( seq -- sorted )
    f [ insert ] reduce inorder ;

{ 5 3 7 1 4 6 8 } treesort .
