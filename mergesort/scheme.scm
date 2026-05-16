(define (merge left right)
  (cond ((null? left) right)
        ((null? right) left)
        ((<= (car left) (car right))
         (cons (car left) (merge (cdr left) right)))
        (else
         (cons (car right) (merge left (cdr right))))))

(define (take lst n)
  (if (or (= n 0) (null? lst))
      '()
      (cons (car lst) (take (cdr lst) (- n 1)))))

(define (drop lst n)
  (if (or (= n 0) (null? lst))
      lst
      (drop (cdr lst) (- n 1))))

(define (merge-sort lst)
  (if (<= (length lst) 1)
      lst
      (let* ((mid (quotient (length lst) 2))
             (left (take lst mid))
             (right (drop lst mid)))
        (merge (merge-sort left) (merge-sort right)))))

(display (merge-sort '(38 27 43 3 9 82 10)))
(newline)
