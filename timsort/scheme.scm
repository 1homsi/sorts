(define min-run 32)

(define (insertion-sort lst)
  (define (insert x sorted)
    (cond
      ((null? sorted) (list x))
      ((<= x (car sorted)) (cons x sorted))
      (else (cons (car sorted) (insert x (cdr sorted))))))
  (fold-right insert '() lst))

(define (fold-right f init lst)
  (if (null? lst)
      init
      (f (car lst) (fold-right f init (cdr lst)))))

(define (merge-runs xs ys)
  (cond
    ((null? xs) ys)
    ((null? ys) xs)
    ((<= (car xs) (car ys))
     (cons (car xs) (merge-runs (cdr xs) ys)))
    (else
     (cons (car ys) (merge-runs xs (cdr ys))))))

(define (take lst n)
  (if (or (= n 0) (null? lst))
      '()
      (cons (car lst) (take (cdr lst) (- n 1)))))

(define (drop lst n)
  (if (or (= n 0) (null? lst))
      lst
      (drop (cdr lst) (- n 1))))

(define (chunks-of n lst)
  (if (null? lst)
      '()
      (cons (take lst n) (chunks-of n (drop lst n)))))

(define (merge-pairs runs)
  (cond
    ((null? runs) '())
    ((null? (cdr runs)) runs)
    (else (cons (merge-runs (car runs) (cadr runs))
                (merge-pairs (cddr runs))))))

(define (merge-all runs)
  (if (null? (cdr runs))
      (car runs)
      (merge-all (merge-pairs runs))))

(define (timsort lst)
  (if (null? lst)
      lst
      (merge-all (map insertion-sort (chunks-of min-run lst)))))

(display (timsort '(5 2 8 1 9 3 7 4 6)))
(newline)
