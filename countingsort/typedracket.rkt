#lang typed/racket

(: counting-sort (-> (Listof Integer) (Listof Integer)))
(define (counting-sort lst)
  (if (null? lst) lst
      (let* ([min-val : Integer (apply min lst)]
             [max-val : Integer (apply max lst)]
             [range : Integer (+ (- max-val min-val) 1)]
             [count : (Vectorof Integer) (make-vector range 0)]
             [n : Integer (length lst)])
        (for ([v (in-list lst)])
          (vector-set! count (- v min-val)
                       (+ 1 (vector-ref count (- v min-val)))))
        (for ([i (in-range 1 range)])
          (vector-set! count i (+ (vector-ref count i) (vector-ref count (- i 1)))))
        (let ([output : (Vectorof Integer) (make-vector n 0)])
          (for ([i (in-range (- n 1) -1 -1)])
            (let* ([v (list-ref lst i)]
                   [idx (- v min-val)]
                   [pos (- (vector-ref count idx) 1)])
              (vector-set! count idx pos)
              (vector-set! output pos v)))
          (vector->list output)))))

(displayln (counting-sort '(4 2 2 8 3 3 1)))
