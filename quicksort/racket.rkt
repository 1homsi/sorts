#lang racket

(define (quicksort lst)
  (if (<= (length lst) 1)
      lst
      (let* ([pivot (car lst)]
             [rest (cdr lst)]
             [left (filter (lambda (x) (<= x pivot)) rest)]
             [right (filter (lambda (x) (> x pivot)) rest)])
        (append (quicksort left) (list pivot) (quicksort right)))))

(displayln (quicksort '(3 6 8 10 1 2 1)))
