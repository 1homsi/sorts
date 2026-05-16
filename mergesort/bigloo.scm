(define (merge l1 l2)
  (cond ((null? l1) l2)
        ((null? l2) l1)
        ((<= (car l1) (car l2)) (cons (car l1) (merge (cdr l1) l2)))
        (else (cons (car l2) (merge l1 (cdr l2))))))

(define (mergesort lst)
  (cond ((null? lst) '())
        ((null? (cdr lst)) lst)
        (else
          (let* ((mid (quotient (length lst) 2))
                 (left (take lst mid))
                 (right (drop lst mid)))
            (merge (mergesort left) (mergesort right))))))

(define (take lst n)
  (if (or (null? lst) (= n 0)) '() (cons (car lst) (take (cdr lst) (- n 1)))))

(define (drop lst n)
  (if (= n 0) lst (drop (cdr lst) (- n 1))))

(print (mergesort '(5 2 8 1 9 3)))
