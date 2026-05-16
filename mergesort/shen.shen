(define merge
    [] R -> R
    L [] -> L
    [Lh | Lt] [Rh | Rt] -> [Lh | (merge Lt [Rh | Rt])] where (<= Lh Rh)
    L [Rh | Rt] -> [Rh | (merge L Rt)])

(define merge-sort
    [] -> []
    [X] -> [X]
    Lst -> (let N (length Lst)
                Mid (div N 2)
                Left (head-n Lst Mid)
                Right (tail-n Lst Mid)
            (merge (merge-sort Left) (merge-sort Right))))

(define head-n
    _ 0 -> []
    [H | T] N -> [H | (head-n T (- N 1))])

(define tail-n
    Lst 0 -> Lst
    [_ | T] N -> (tail-n T (- N 1)))

(print (merge-sort [38 27 43 3 9 82 10]))
