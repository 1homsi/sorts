(define insert-sorted
    X [] -> [X]
    X [H|T] -> [X H | T] where (<= X H)
    X [H|T] -> [H | (insert-sorted X T)])

(define insertion-sort
    [] -> []
    [H|T] -> (insert-sorted H (insertion-sort T)))

(define get-idx
    Num Mn Mx N ->
    (let Raw (floor (* (/ (- Num Mn) (+ (- Mx Mn) 1)) N))
        (if (>= Raw N) (- N 1) Raw)))

(define fill-buckets
    [] _ _ _ Bs -> Bs
    [X|Xs] Mn Mx N Bs ->
    (let Idx (get-idx X Mn Mx N)
        NewBs (update-bucket Bs Idx X 0)
        (fill-buckets Xs Mn Mx N NewBs)))

(define update-bucket
    [] _ _ _ -> []
    [B|Bs] Idx X 0 -> (if (= Idx 0) [(append B [X]) | Bs] [B | (update-bucket Bs Idx X 0)])
    _ _ _ _ -> [])

(define bucket-sort
    [] -> []
    Arr ->
    (let N (length Arr)
         Mn (fold-left (fn [M V] (if (< V M) V M)) (head Arr) Arr)
         Mx (fold-left (fn [M V] (if (> V M) V M)) (head Arr) Arr)
         Bs (fill-buckets Arr Mn Mx N (repeat N []))
         (apply append (map insertion-sort Bs))))

(print (bucket-sort [0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68]))
