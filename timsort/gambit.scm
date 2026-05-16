(define (timsort arr minSize)
  (mergesort arr minSize))

(define (mergesort arr minSize)
  (cond
    ((<= (length arr) 1) arr)
    ((<= (length arr) minSize) (insertionsort arr))
    (else
      (let ((mid (quotient (length arr) 2)))
        (merge
          (mergesort (list->vector (take arr mid)) minSize)
          (mergesort (list->vector (drop arr mid)) minSize))))))

(define (take lst n)
  (if (or (= n 0) (null? lst))
    '()
    (cons (car lst) (take (cdr lst) (- n 1)))))

(define (drop lst n)
  (if (or (= n 0) (null? lst))
    lst
    (drop (cdr lst) (- n 1))))

(define (insertionsort arr)
  (let ((result (list->vector arr)))
    (for-each (lambda (i)
      (let ((key (vector-ref result i)))
        (let loop ((j (- i 1)))
          (if (and (>= j 0) (> (vector-ref result j) key))
            (begin
              (vector-set! result (+ j 1) (vector-ref result j))
              (loop (- j 1)))))))
      (iota (length arr) 1))
    (vector->list result)))

(define (merge left right)
  (cond
    ((null? left) right)
    ((null? right) left)
    ((<= (car left) (car right))
     (cons (car left) (merge (cdr left) right)))
    (else
     (cons (car right) (merge left (cdr right))))))

(display (timsort '(5 2 8 1 9 3) 32))
(newline)
