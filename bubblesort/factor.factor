USING: kernel sequences math io prettyprint ;
IN: bubble-sort

: bubble-pass ( seq -- seq swapped? )
    clone dup length 1- :> n
    f :> swapped! [
        dup [ n < ] [ drop ] smart-if*
    ] [
        2dup [ nth ] [ 1 + nth ] 2bi > [
            2dup [ nth ] [ 1 + nth ] 2bi
            pick 1 + pick set-nth
            pick pick set-nth
            drop
            t swapped!
        ] when 1 +
    ] while drop swapped ;

: bubble-sort ( seq -- sorted )
    [ bubble-pass ] loop ;

{ 64 34 25 12 22 11 90 } bubble-sort .
