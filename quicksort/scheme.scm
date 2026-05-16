(define (quicksort lst)
  (if (or (null? lst) (null? (cdr lst)))
      lst
      (let ((pivot (car lst))
            (rest (cdr lst)))
        (let ((left (filter (lambda (x) (<= x pivot)) rest))
              (right (filter (lambda (x) (> x pivot)) rest)))
          (append (quicksort left) (list pivot) (quicksort right))))))

(display (quicksort '(3 6 8 10 1 2 1)))
(newline)
