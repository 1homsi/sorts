#lang racket

(define min-run 32)

(define (insertion-sort lst)
  (define (insert x sorted)
    (cond
      [(empty? sorted) (list x)]
      [(<= x (first sorted)) (cons x sorted)]
      [else (cons (first sorted) (insert x (rest sorted)))]))
  (foldr insert '() lst))

(define (merge-runs xs ys)
  (cond
    [(empty? xs) ys]
    [(empty? ys) xs]
    [(<= (first xs) (first ys))
     (cons (first xs) (merge-runs (rest xs) ys))]
    [else
     (cons (first ys) (merge-runs xs (rest ys)))]))

(define (chunks-of n lst)
  (if (empty? lst)
      '()
      (cons (take lst (min n (length lst)))
            (chunks-of n (drop lst (min n (length lst)))))))

(define (merge-pairs runs)
  (cond
    [(empty? runs) '()]
    [(empty? (rest runs)) runs]
    [else (cons (merge-runs (first runs) (second runs))
                (merge-pairs (cddr runs)))]))

(define (merge-all runs)
  (if (= 1 (length runs))
      (first runs)
      (merge-all (merge-pairs runs))))

(define (timsort lst)
  (if (empty? lst)
      lst
      (merge-all (map insertion-sort (chunks-of min-run lst)))))

(displayln (timsort '(5 2 8 1 9 3 7 4 6)))
