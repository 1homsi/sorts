#lang typed/racket

(: compare-and-swap! (-> (Vectorof Integer) Integer Integer Boolean Void))
(define (compare-and-swap! v i j dir)
  (when (eq? dir (> (vector-ref v i) (vector-ref v j)))
    (define tmp (vector-ref v i))
    (vector-set! v i (vector-ref v j))
    (vector-set! v j tmp)))

(: bitonic-merge! (-> (Vectorof Integer) Integer Integer Boolean Void))
(define (bitonic-merge! v lo cnt dir)
  (when (> cnt 1)
    (define k (quotient cnt 2))
    (for ([i (in-range lo (+ lo k))])
      (compare-and-swap! v i (+ i k) dir))
    (bitonic-merge! v lo k dir)
    (bitonic-merge! v (+ lo k) k dir)))

(: bitonic-sort! (-> (Vectorof Integer) Integer Integer Boolean Void))
(define (bitonic-sort! v lo cnt dir)
  (when (> cnt 1)
    (define k (quotient cnt 2))
    (bitonic-sort! v lo k #t)
    (bitonic-sort! v (+ lo k) k #f)
    (bitonic-merge! v lo cnt dir)))

(define v : (Vectorof Integer) (vector 3 7 4 8 6 2 1 5))
(bitonic-sort! v 0 (vector-length v) #t)
(displayln (vector->list v))
