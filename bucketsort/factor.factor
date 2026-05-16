USING: kernel sequences math math.order arrays io ;
IN: bucket-sort

: insert-sorted ( x seq -- seq )
    [ dup empty? [ drop 1array ] [ over first 2dup <= [ swap prefix nip ] [ [ rest ] dip insert-sorted swap 1array prepend ] if ] if ] keep drop ;

: insertion-sort ( seq -- sorted )
    { } [ insert-sorted ] reduce ;

: get-idx ( num min max n -- idx )
    [ pick - ] dip [ pick - 1 + ] dip [ * ] dip swap / floor >integer swap 1 - min ;

: fill-bucket ( num min max n buckets -- buckets )
    [ 4 npick 4 npick 4 npick 4 npick get-idx ] keep
    [ swap nth ] 2keep
    [ rot suffix ] keep
    rot set-nth ;

: bucket-sort ( seq -- sorted )
    dup length 0 = [ ] [
        dup length :> n
        dup [ ] [ min ] reduce :> mn
        dup [ ] [ max ] reduce :> mx
        n [ { } ] replicate :> buckets
        [ mn mx n buckets fill-bucket drop ] each
        buckets [ insertion-sort ] map concat
    ] if ;

{ 0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68 } bucket-sort .
