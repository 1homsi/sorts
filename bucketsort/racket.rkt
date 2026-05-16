#lang racket

(define (insertion-sort lst)
  (define (insert x sorted)
    (cond [(null? sorted) (list x)]
          [(<= x (car sorted)) (cons x sorted)]
          [else (cons (car sorted) (insert x (cdr sorted)))]))
  (if (null? lst)
      '()
      (insert (car lst) (insertion-sort (cdr lst)))))

(define (bucket-sort arr)
  (let* ([n (length arr)]
         [mn (apply min arr)]
         [mx (apply max arr)]
         [buckets (make-vector n '())])
    (for-each
     (lambda (num)
       (let ([idx (min (- n 1)
                       (exact (floor (* (/ (- num mn) (+ (- mx mn) 1)) n))))])
         (vector-set! buckets idx (cons num (vector-ref buckets idx)))))
     arr)
    (apply append
           (map insertion-sort (vector->list buckets)))))

(display (bucket-sort '(0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68)))
(newline)
