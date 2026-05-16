#lang typed/racket
(define (selection-sort [vec : (Vectorof Integer)]) : (Vectorof Integer)
  (define n (vector-length vec))
  (for ([i (in-range n)])
    (define min-idx : Integer
      (for/fold ([mi : Integer i]) ([j (in-range (add1 i) n)])
        (if (< (vector-ref vec j) (vector-ref vec mi)) j mi)))
    (define tmp (vector-ref vec i))
    (vector-set! vec i (vector-ref vec min-idx))
    (vector-set! vec min-idx tmp))
  vec)
