#lang typed/racket

(: merge (-> (Listof Integer) (Listof Integer) (Listof Integer)))
(define (merge left right)
  (cond
    [(empty? left) right]
    [(empty? right) left]
    [(<= (first left) (first right))
     (cons (first left) (merge (rest left) right))]
    [else
     (cons (first right) (merge left (rest right)))]))

(: merge-sort (-> (Listof Integer) (Listof Integer)))
(define (merge-sort lst)
  (define n (length lst))
  (if (<= n 1)
      lst
      (let* ([mid (quotient n 2)]
             [left (take lst mid)]
             [right (drop lst mid)])
        (merge (merge-sort left) (merge-sort right)))))

(displayln (merge-sort '(38 27 43 3 9 82 10)))
