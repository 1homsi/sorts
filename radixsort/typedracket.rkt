#lang typed/racket

(: get-digit (-> Integer Integer Integer))
(define (get-digit x exp)
  (modulo (quotient x exp) 10))

(: counting-sort (-> (Listof Integer) Integer (Listof Integer)))
(define (counting-sort lst exp)
  (apply append
    (for/list : (Listof (Listof Integer)) ([d : Integer (in-range 10)])
      (filter (lambda ([x : Integer]) (= (get-digit x exp) d)) lst))))

(: radix-sort (-> (Listof Integer) (Listof Integer)))
(define (radix-sort lst)
  (if (null? lst) lst
      (let ([max-val (apply max lst)])
        (let loop ([arr : (Listof Integer) lst] [exp : Integer 1])
          (if (> (quotient max-val exp) 0)
              (loop (counting-sort arr exp) (* exp 10))
              arr)))))

(displayln (radix-sort '(170 45 75 90 802 24 2 66)))
