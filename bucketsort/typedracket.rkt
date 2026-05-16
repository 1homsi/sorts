#lang typed/racket

(: insert-sorted (-> Float (Listof Float) (Listof Float)))
(define (insert-sorted x lst)
  (cond [(null? lst) (list x)]
        [(<= x (car lst)) (cons x lst)]
        [else (cons (car lst) (insert-sorted x (cdr lst)))]))

(: insertion-sort (-> (Listof Float) (Listof Float)))
(define (insertion-sort lst)
  (if (null? lst) '()
      (insert-sorted (car lst) (insertion-sort (cdr lst)))))

(: get-idx (-> Float Float Float Integer Integer))
(define (get-idx num mn mx n)
  (min (- n 1)
       (exact-round (floor (* (/ (- num mn) (+ (- mx mn) 1.0)) (exact->inexact n))))))

(: bucket-sort (-> (Listof Float) (Listof Float)))
(define (bucket-sort arr)
  (if (null? arr) arr
      (let* ([n (length arr)]
             [mn (apply min arr)]
             [mx (apply max arr)]
             [buckets : (Vectorof (Listof Float)) (make-vector n '())])
        (for-each (lambda ([x : Float])
                    (let ([idx (get-idx x mn mx n)])
                      (vector-set! buckets idx
                                   (append (vector-ref buckets idx) (list x)))))
                  arr)
        (apply append (map insertion-sort (vector->list buckets))))))

(display (bucket-sort '(0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68)))
(newline)
