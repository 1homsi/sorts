#lang racket

(define (insert x lst)
  (cond [(empty? lst) (list x)]
        [(<= x (first lst)) (cons x lst)]
        [else (cons (first lst) (insert x (rest lst)))]))

(define (insertion-sort lst)
  (if (empty? lst)
      '()
      (insert (first lst) (insertion-sort (rest lst)))))
