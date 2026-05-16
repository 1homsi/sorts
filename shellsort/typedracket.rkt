#lang typed/racket

(: shell-sort! (-> (Vectorof Integer) (Vectorof Integer)))
(define (shell-sort! v)
  (define n (vector-length v))
  (let loop ([gap : Integer (quotient n 2)])
    (when (> gap 0)
      (for ([i (in-range gap n)])
        (define temp (vector-ref v i))
        (let inner ([j : Integer i])
          (if (and (>= j gap) (> (vector-ref v (- j gap)) temp))
              (begin
                (vector-set! v j (vector-ref v (- j gap)))
                (inner (- j gap)))
              (vector-set! v j temp))))
      (loop (quotient gap 2))))
  v)

(define arr : (Vectorof Integer) (vector 64 34 25 12 22 11 90))
(displayln (vector->list (shell-sort! arr)))
