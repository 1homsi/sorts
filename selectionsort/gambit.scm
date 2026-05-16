(define (selection-sort lst)
  (define (insert-sorted x lst)
    (cond
      ((null? lst) (list x))
      ((<= x (car lst)) (cons x lst))
      (else (cons (car lst) (insert-sorted x (cdr lst))))))
  (if (null? lst) lst
      (insert-sorted (car lst) (selection-sort (cdr lst)))))

(display (selection-sort '(5 2 8 1 9 3)))
(newline)