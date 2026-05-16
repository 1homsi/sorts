(define stooge-sort
    Arr First Last ->
    (let A (nth (+ First 1) Arr)
         B (nth (+ Last 1) Arr)
         Arr1 (if (> A B)
                   (replace-nth (+ First 1) B (replace-nth (+ Last 1) A Arr))
                   Arr)
         N (- (+ Last 1) First)
     (if (> N 2)
         (let T (floor (/ (* N 2) 3))
              Arr2 (stooge-sort Arr1 First (+ First T -1))
              Arr3 (stooge-sort Arr2 (- Last T -1) Last)
          (stooge-sort Arr3 First (+ First T -1)))
         Arr1)))

(define replace-nth
    1 X (_ . T) -> (cons X T)
    N X (H . T) -> (cons H (replace-nth (- N 1) X T)))

(let Arr [3 1 4 1 5 9 2 6]
     Result (stooge-sort Arr 0 7)
     (output "~A~%" Result))
