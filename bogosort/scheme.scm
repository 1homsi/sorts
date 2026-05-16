(define (is-sorted? lst)
  (or (null? lst) (null? (cdr lst))
      (and (<= (car lst) (cadr lst))
           (is-sorted? (cdr lst)))))

(define (shuffle lst)
  (let* ((vec (list->vector lst))
         (n (vector-length vec)))
    (do ((i (- n 1) (- i 1)))
        ((= i 0) (vector->list vec))
      (let* ((j (random (+ i 1)))
             (tmp (vector-ref vec i)))
        (vector-set! vec i (vector-ref vec j))
        (vector-set! vec j tmp)))))

(define (bogosort lst)
  (if (is-sorted? lst)
      lst
      (bogosort (shuffle lst))))

(display (bogosort '(3 1 4 1 5 9 2 6)))
(newline)
