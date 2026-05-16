(define (quicksort arr)
  (if (<= (length arr) 1)
    arr
    (let* ((pivot (car arr))
           (rest (cdr arr))
           (less (filter (lambda (x) (<= x pivot)) rest))
           (greater (filter (lambda (x) (> x pivot)) rest)))
      (append (quicksort less) (cons pivot (quicksort greater))))))

(display (quicksort '(5 2 8 1 9 3)))
(newline)