(define (radixsort arr)
  (let ((max (apply max arr)))
    (let loop ((arr arr) (exp 1))
      (if (<= (/ max exp) 0)
        arr
        (loop (counting-sort-by-exp arr exp) (* exp 10))))))

(define (counting-sort-by-exp arr exp)
  (let* ((n (length arr))
         (output (make-vector n 0))
         (count (make-vector 10 0)))
    (for-each
      (lambda (x)
        (let ((idx (modulo (quotient x exp) 10)))
          (vector-set! count idx (+ (vector-ref count idx) 1))))
      arr)
    (do ((i 1 (+ i 1)))
      ((>= i 10))
      (vector-set! count i (+ (vector-ref count i) (vector-ref count (- i 1)))))
    arr))

(display (radixsort '(5 2 8 1 9 3)))
