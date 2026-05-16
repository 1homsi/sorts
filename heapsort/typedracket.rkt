#lang typed/racket

(define (heapify! [arr : (Vectorof Integer)] [n : Integer] [i : Integer]) : Void
  (define left (+ (* 2 i) 1))
  (define right (+ (* 2 i) 2))
  (define largest0 (if (and (< left n) (> (vector-ref arr left) (vector-ref arr i))) left i))
  (define largest (if (and (< right n) (> (vector-ref arr right) (vector-ref arr largest0))) right largest0))
  (unless (= largest i)
    (define tmp (vector-ref arr i))
    (vector-set! arr i (vector-ref arr largest))
    (vector-set! arr largest tmp)
    (heapify! arr n largest)))

(define (heapsort! [arr : (Vectorof Integer)]) : (Vectorof Integer)
  (define n (vector-length arr))
  (for ([i (in-range (- (quotient n 2) 1) -1 -1)]) (heapify! arr n i))
  (for ([i (in-range (- n 1) 0 -1)])
    (define tmp (vector-ref arr 0))
    (vector-set! arr 0 (vector-ref arr i))
    (vector-set! arr i tmp)
    (heapify! arr i 0))
  arr)

(define v : (Vectorof Integer) (vector 12 11 13 5 6 7))
(displayln (heapsort! v))
