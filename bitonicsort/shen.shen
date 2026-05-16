(define compare-and-swap
    Arr I J Dir ->
    (let Ai (vector-> Arr I)
         Aj (vector-> Arr J)
    (if (= Dir (> Ai Aj))
        (do (address-> Arr I Aj) (address-> Arr J Ai) Arr)
        Arr)))

(define bitonic-merge
    Arr Lo Cnt Dir ->
    (if (<= Cnt 1)
        Arr
        (let K (div Cnt 2)
             _ (for-each (fn I (compare-and-swap Arr I (+ I K) Dir))
                         (range Lo (+ Lo K)))
        (do (bitonic-merge Arr Lo K Dir)
            (bitonic-merge Arr (+ Lo K) K Dir)
            Arr))))

(define bitonic-sort
    Arr Lo Cnt Dir ->
    (if (<= Cnt 1)
        Arr
        (let K (div Cnt 2)
        (do (bitonic-sort Arr Lo K true)
            (bitonic-sort Arr (+ Lo K) K false)
            (bitonic-merge Arr Lo Cnt Dir)
            Arr))))

(let Data (vector 3 7 4 8 6 2 1 5)
     Sorted (bitonic-sort Data 0 8 true)
(print Sorted))
