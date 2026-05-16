#lang typed/racket

(: stooge-sort! (-> (Vectorof Integer) Integer Integer Void))
(define (stooge-sort! vec first last)
    (when (> (vector-ref vec first) (vector-ref vec last))
        (define tmp (vector-ref vec first))
        (vector-set! vec first (vector-ref vec last))
        (vector-set! vec last tmp))
    (define n (- last first -1))
    (when (> n 2)
        (define t (quotient (* n 2) 3))
        (stooge-sort! vec first (+ first t -1))
        (stooge-sort! vec (- last t -1) last)
        (stooge-sort! vec first (+ first t -1))))

(define arr : (Vectorof Integer) (vector 3 1 4 1 5 9 2 6))
(stooge-sort! arr 0 (sub1 (vector-length arr)))
(displayln arr)
