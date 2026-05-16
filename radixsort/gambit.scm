(define (radixsort arr)
  (let ((max (apply max arr)))
    (let loop ((arr arr) (exp 1))
      (if (<= (/ max exp) 0)
        arr
        (loop (counting-sort-by-exp arr exp) (* exp 10))))))

(define (counting-sort-by-exp arr exp) arr)

(display (radixsort '(5 2 8 1 9 3)))
