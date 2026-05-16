#lang typed/racket

(: flip! (-> (Vectorof Integer) Integer Void))
(define (flip! vec k)
  (let loop ((l : Integer 0) (r : Integer k))
    (when (< l r)
      (define tmp (vector-ref vec l))
      (vector-set! vec l (vector-ref vec r))
      (vector-set! vec r tmp)
      (loop (+ l 1) (- r 1)))))

(: find-max-idx (-> (Vectorof Integer) Integer Integer))
(define (find-max-idx vec size)
  (let loop ((i : Integer 1) (mi : Integer 0))
    (if (= i size) mi
        (loop (+ i 1)
              (if (> (vector-ref vec i) (vector-ref vec mi)) i mi)))))

(: pancake-sort! (-> (Vectorof Integer) Void))
(define (pancake-sort! vec)
  (let loop ((size : Integer (vector-length vec)))
    (when (> size 1)
      (define mi (find-max-idx vec size))
      (unless (= mi (- size 1))
        (unless (= mi 0) (flip! vec mi))
        (flip! vec (- size 1)))
      (loop (- size 1)))))

(define v : (Vectorof Integer) (vector 3 6 2 7 4 1 5))
(pancake-sort! v)
(displayln v)
