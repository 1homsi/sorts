(define (bogosort lst)
  (if (issorted lst)
    lst
    (bogosort (shuffle lst))))

(define (issorted lst)
  (cond
    ((null? lst) #t)
    ((null? (cdr lst)) #t)
    ((> (car lst) (cadr lst)) #f)
    (else (issorted (cdr lst)))))

(define (shuffle lst) lst)

(print (bogosort '(3 1 2)))
