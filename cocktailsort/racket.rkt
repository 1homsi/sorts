#lang racket

(define (cocktail-sort! vec)
  (let ((n (vector-length vec)))
    (let outer ((start 0) (end (- n 1)) (swapped #t))
      (when swapped
        (let fwd ((i start) (sw #f))
          (if (< i end)
              (if (> (vector-ref vec i) (vector-ref vec (+ i 1)))
                  (begin
                    (define tmp (vector-ref vec i))
                    (vector-set! vec i (vector-ref vec (+ i 1)))
                    (vector-set! vec (+ i 1) tmp)
                    (fwd (+ i 1) #t))
                  (fwd (+ i 1) sw))
              (when sw
                (let bwd ((i (- end 1)) (sw2 #f))
                  (if (>= i start)
                      (if (> (vector-ref vec i) (vector-ref vec (+ i 1)))
                          (begin
                            (define tmp (vector-ref vec i))
                            (vector-set! vec i (vector-ref vec (+ i 1)))
                            (vector-set! vec (+ i 1) tmp)
                            (bwd (- i 1) #t))
                          (bwd (- i 1) sw2))
                      (outer (+ start 1) (- end 1) sw2)))))))))
  vec)
