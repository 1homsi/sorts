#lang racket

(define (shell-sort arr)
  (let ((n (vector-length arr)))
    (let gap-loop ((gap (quotient n 2)))
      (when (> gap 0)
        (for ((i (in-range gap n)))
          (let ((temp (vector-ref arr i)))
            (let j-loop ((j i))
              (if (and (>= j gap) (> (vector-ref arr (- j gap)) temp))
                  (begin
                    (vector-set! arr j (vector-ref arr (- j gap)))
                    (j-loop (- j gap)))
                  (vector-set! arr j temp)))))
        (gap-loop (quotient gap 2))))
    arr))

(define arr (vector 64 34 25 12 22 11 90))
(displayln (vector->list (shell-sort arr)))
