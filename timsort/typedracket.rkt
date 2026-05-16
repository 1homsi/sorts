#lang typed/racket

(define min-run : Integer 32)

(: insert-val (Integer (Listof Integer) -> (Listof Integer)))
(define (insert-val x lst)
  (cond
    [(empty? lst) (list x)]
    [(<= x (first lst)) (cons x lst)]
    [else (cons (first lst) (insert-val x (rest lst)))]))

(: insertion-sort ((Listof Integer) -> (Listof Integer)))
(define (insertion-sort lst)
  (foldr insert-val '() lst))

(: merge-runs ((Listof Integer) (Listof Integer) -> (Listof Integer)))
(define (merge-runs xs ys)
  (cond
    [(empty? xs) ys]
    [(empty? ys) xs]
    [(<= (first xs) (first ys))
     (cons (first xs) (merge-runs (rest xs) ys))]
    [else (cons (first ys) (merge-runs xs (rest ys)))]))

(: chunks-of (Integer (Listof Integer) -> (Listof (Listof Integer))))
(define (chunks-of n lst)
  (if (empty? lst) '()
      (cons (take lst (min n (length lst)))
            (chunks-of n (drop lst (min n (length lst)))))))

(: merge-pairs ((Listof (Listof Integer)) -> (Listof (Listof Integer))))
(define (merge-pairs runs)
  (cond
    [(empty? runs) '()]
    [(empty? (rest runs)) runs]
    [else (cons (merge-runs (first runs) (second runs))
                (merge-pairs (cddr runs)))]))

(: merge-all ((Listof (Listof Integer)) -> (Listof Integer)))
(define (merge-all runs)
  (if (= 1 (length runs)) (first runs)
      (merge-all (merge-pairs runs))))

(: timsort ((Listof Integer) -> (Listof Integer)))
(define (timsort lst)
  (if (empty? lst) lst
      (merge-all (map insertion-sort (chunks-of min-run lst)))))

(displayln (timsort '(5 2 8 1 9 3 7 4 6)))
