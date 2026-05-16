#lang racket

(define (merge left right)
  (cond [(empty? left) right]
        [(empty? right) left]
        [(<= (first left) (first right))
         (cons (first left) (merge (rest left) right))]
        [else
         (cons (first right) (merge left (rest right)))]))

(define (merge-sort lst)
  (if (<= (length lst) 1)
      lst
      (let* ([mid (quotient (length lst) 2)]
             [left (take lst mid)]
             [right (drop lst mid)])
        (merge (merge-sort left) (merge-sort right)))))

(displayln (merge-sort '(38 27 43 3 9 82 10)))
