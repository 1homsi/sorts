#lang racket

(define (counting-sort lst exp)
  (let* ((n (length lst))
         (v (list->vector lst))
         (output (make-vector n 0))
         (count (make-vector 10 0)))
    (for ([i n])
      (let ([idx (modulo (quotient (vector-ref v i) exp) 10)])
        (vector-set! count idx (add1 (vector-ref count idx)))))
    (for ([i (in-range 1 10)])
      (vector-set! count i (+ (vector-ref count i) (vector-ref count (sub1 i)))))
    (for ([i (in-range (sub1 n) -1 -1)])
      (let* ([x (vector-ref v i)]
             [idx (modulo (quotient x exp) 10)]
             [pos (sub1 (vector-ref count idx))])
        (vector-set! count idx pos)
        (vector-set! output pos x)))
    (vector->list output)))

(define (radix-sort lst)
  (if (null? lst) lst
      (let ([max-val (apply max lst)])
        (let loop ([arr lst] [exp 1])
          (if (> (quotient max-val exp) 0)
              (loop (counting-sort arr exp) (* exp 10))
              arr)))))

(displayln (radix-sort '(170 45 75 90 802 24 2 66)))
