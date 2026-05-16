#lang typed/racket

(: is-sorted? (-> (Listof Integer) Boolean))
(define (is-sorted? lst)
  (or (null? lst) (null? (cdr lst))
      (and (<= (car lst) (cadr lst))
           (is-sorted? (cdr lst)))))

(: shuffle (-> (Listof Integer) (Listof Integer)))
(define (shuffle lst)
  (let* ((vec (list->vector lst))
         (n (vector-length vec)))
    (for ([i (in-range (- n 1) 0 -1)])
      (let* ([j (random (+ i 1))]
             [tmp (vector-ref vec i)])
        (vector-set! vec i (vector-ref vec j))
        (vector-set! vec j tmp)))
    (vector->list vec)))

(: bogosort (-> (Listof Integer) (Listof Integer)))
(define (bogosort lst)
  (if (is-sorted? lst) lst (bogosort (shuffle lst))))

(displayln (bogosort '(3 1 4 1 5 9 2 6)))
