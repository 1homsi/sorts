#lang typed/racket

(define (cocktail-sort! [vec : (Vectorof Integer)]) : (Vectorof Integer)
  (define n (vector-length vec))
  (let outer ([start : Integer 0] [end : Integer (- n 1)] [swapped : Boolean #t])
    (when swapped
      (define sw1 : Boolean
        (let fwd ([i : Integer start] [sw : Boolean #f])
          (if (>= i end) sw
              (if (> (vector-ref vec i) (vector-ref vec (+ i 1)))
                  (begin
                    (define tmp (vector-ref vec i))
                    (vector-set! vec i (vector-ref vec (+ i 1)))
                    (vector-set! vec (+ i 1) tmp)
                    (fwd (+ i 1) #t))
                  (fwd (+ i 1) sw)))))
      (when sw1
        (define sw2 : Boolean
          (let bwd ([i : Integer (- end 1)] [sw : Boolean #f])
            (if (< i start) sw
                (if (> (vector-ref vec i) (vector-ref vec (+ i 1)))
                    (begin
                      (define tmp (vector-ref vec i))
                      (vector-set! vec i (vector-ref vec (+ i 1)))
                      (vector-set! vec (+ i 1) tmp)
                      (bwd (- i 1) #t))
                    (bwd (- i 1) sw)))))
        (outer (+ start 1) (- end 1) sw2))))
  vec)
