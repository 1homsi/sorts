(define (quicksort arr)
  (cond
    ((<= (length arr) 1) arr)
    (else
      (let ((pivot (car arr))
            (rest (cdr arr)))
        (append
          (quicksort (filter (lambda (x) (<= x pivot)) rest))
          (cons pivot (quicksort (filter (lambda (x) (> x pivot)) rest))))))))

(print (quicksort '(5 2 8 1 9 3)))