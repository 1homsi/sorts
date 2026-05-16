(define shell-sort-helper
  Arr Gap N -> Arr where (= Gap 0)
  Arr Gap N ->
    (let _ (insertion-pass Arr Gap Gap N)
         (shell-sort-helper Arr (div Gap 2) N)))

(define insertion-pass
  Arr Gap I N -> Arr where (>= I N)
  Arr Gap I N ->
    (let Temp (vector-> Arr I)
         _ (shift-back Arr Gap I Temp)
         (insertion-pass Arr Gap (+ I 1) N)))

(define shift-back
  Arr Gap J Temp -> (vector-> Arr J Temp) where (< J Gap)
  Arr Gap J Temp ->
    (if (> (<-vector Arr (- J Gap)) Temp)
        (let _ (vector-> Arr J (<-vector Arr (- J Gap)))
             (shift-back Arr Gap (- J Gap) Temp))
        (vector-> Arr J Temp)))

(define shell-sort
  Lst ->
    (let N (length Lst)
         Arr (list->vector Lst (vector N))
         _ (shell-sort-helper Arr (div N 2) N)
         (vector->list Arr N)))

(print (shell-sort [64 34 25 12 22 11 90]))
