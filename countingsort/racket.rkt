#lang racket

(define (counting-sort arr)
  (if (null? arr)
      arr
      (let* ([min-val (apply min arr)]
             [max-val (apply max arr)]
             [range (+ 1 (- max-val min-val))]
             [count (make-vector range 0)]
             [n (length arr)]
             [output (make-vector n 0)]
             [vec (list->vector arr)])
        (for ([v (in-vector vec)])
          (vector-set! count (- v min-val) (+ 1 (vector-ref count (- v min-val)))))
        (for ([i (in-range 1 range)])
          (vector-set! count i (+ (vector-ref count i) (vector-ref count (- i 1)))))
        (for ([i (in-range (- n 1) -1 -1)])
          (let* ([v (vector-ref vec i)]
                 [idx (- v min-val)]
                 [pos (- (vector-ref count idx) 1)])
            (vector-set! count idx pos)
            (vector-set! output pos v)))
        (vector->list output))))

(displayln (counting-sort '(4 2 2 8 3 3 1)))
