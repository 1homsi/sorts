(define countingsort
  (lambda (arr)
    (let* ((max (apply max arr))
           (count (make-vector (+ max 1) 0))
           (output '()))
      (for-each (lambda (x) (vector-set! count x (+ 1 (vector-ref count x)))) arr)
      (do ((i 0 (+ i 1)))
          ((> i max) output)
        (do ((j 0 (+ j 1)))
            ((>= j (vector-ref count i)))
          (set! output (append output (list i))))))))

(display (countingsort '(5 2 8 1 9 3)))
(newline)
