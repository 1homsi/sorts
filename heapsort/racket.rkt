#lang racket

(define (heapify arr n i)
  (let* ([largest i]
         [left (+ (* 2 i) 1)]
         [right (+ (* 2 i) 2)]
         [largest (if (and (< left n) (> (vector-ref arr left) (vector-ref arr largest))) left largest)]
         [largest (if (and (< right n) (> (vector-ref arr right) (vector-ref arr largest))) right largest)])
    (unless (= largest i)
      (let ([tmp (vector-ref arr i)])
        (vector-set! arr i (vector-ref arr largest))
        (vector-set! arr largest tmp))
      (heapify arr n largest))))

(define (heapsort arr)
  (define n (vector-length arr))
  (for ([i (in-range (- (quotient n 2) 1) -1 -1)]) (heapify arr n i))
  (for ([i (in-range (- n 1) 0 -1)])
    (let ([tmp (vector-ref arr 0)])
      (vector-set! arr 0 (vector-ref arr i))
      (vector-set! arr i tmp))
    (heapify arr i 0))
  arr)

(define arr (vector 12 11 13 5 6 7))
(heapsort arr)
(displayln arr)
