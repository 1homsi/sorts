USING: sequences kernel math ;
IN: gnome-sort

: gnome-sort ( seq -- seq' )
    clone
    [ dup length ] keep
    [ 2dup length < ] [
        2dup [
            over 0 = [
                [ 1 + ] dip
            ] [
                2dup [ nth ] [ 1 - swap nth ] 2bi >= [
                    [ 1 + ] dip
                ] [
                    2dup swap 1 - exchange
                    [ 1 - ] dip
                ] if
            ] if
        ] keep
    ] while
    nip ;
