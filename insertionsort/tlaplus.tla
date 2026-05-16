--------------------------- MODULE InsertionSort ----------------------------
EXTENDS Integers, Sequences

InsertionSort(arr) ==
    LET Insert(x, s) ==
            IF s = <<>> THEN <<x>>
            ELSE IF x <= Head(s) THEN <<x>> \o s
            ELSE <<Head(s)>> \o Insert(x, Tail(s))
        Fold(op(_, _), init, seq) ==
            IF seq = <<>> THEN init
            ELSE op(Head(seq), Fold(op, init, Tail(seq)))
    IN Fold(Insert, <<>>, arr)
=============================================================================
