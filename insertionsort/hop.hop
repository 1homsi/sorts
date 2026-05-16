(define (insert x lst)
  (cond ((null? lst) (list x))
        ((<= x (car lst)) (cons x lst))
        (else (cons (car lst) (insert x (cdr lst))))))

(define (insertion-sort lst)
  (if (null? lst)
      '()
      (insert (car lst) (insertion-sort (cdr lst)))))
