#lang racket
(define (selection-sort lst)
  (define (remove-first x lst)
    (cond [(empty? lst) '()]
          [(= (first lst) x) (rest lst)]
          [else (cons (first lst) (remove-first x (rest lst)))]))
  (if (empty? lst)
      '()
      (let ([m (apply min lst)])
        (cons m (selection-sort (remove-first m lst))))))
