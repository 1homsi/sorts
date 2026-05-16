#lang racket

(define (bubble-sort! vec)
  (define n (vector-length vec))
  (let loop ((n n))
    (when (> n 1)
      (define swapped #f)
      (for ([i (in-range (- n 1))])
        (when (> (vector-ref vec i) (vector-ref vec (+ i 1)))
          (define tmp (vector-ref vec i))
          (vector-set! vec i (vector-ref vec (+ i 1)))
          (vector-set! vec (+ i 1) tmp)
          (set! swapped #t)))
      (when swapped (loop (- n 1))))))

(define arr (vector 64 34 25 12 22 11 90))
(bubble-sort! arr)
(displayln arr)
