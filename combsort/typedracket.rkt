#lang typed/racket

(: comb-sort! ((Vectorof Integer) -> (Vectorof Integer)))
(define (comb-sort! v)
  (define n (vector-length v))
  (let loop ([gap : Integer n])
    (define g : Integer (max 1 (exact (floor (/ gap 1.3)))))
    (define changed : Boolean
      (for/fold ([ch : Boolean #f]) ([i (in-range (- n g))])
        (cond
          [(> (vector-ref v i) (vector-ref v (+ i g)))
           (define tmp (vector-ref v i))
           (vector-set! v i (vector-ref v (+ i g)))
           (vector-set! v (+ i g) tmp)
           #t]
          [else ch])))
    (unless (and (= g 1) (not changed))
      (loop g)))
  v)
