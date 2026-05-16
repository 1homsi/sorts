#lang typed/racket

(: gnome-sort (-> (Listof Integer) (Listof Integer)))
(define (gnome-sort lst)
  (define arr : (Vectorof Integer) (list->vector lst))
  (define n : Integer (vector-length arr))
  (let loop ([i : Integer 0])
    (cond
      [(>= i n) (void)]
      [(or (= i 0) (>= (vector-ref arr i) (vector-ref arr (- i 1))))
       (loop (+ i 1))]
      [else
       (define tmp : Integer (vector-ref arr i))
       (vector-set! arr i (vector-ref arr (- i 1)))
       (vector-set! arr (- i 1) tmp)
       (loop (- i 1))]))
  (vector->list arr))
