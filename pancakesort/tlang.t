(define (pancake-sort lst)
  (if (null? lst) lst
      (cons (apply min lst)
            (pancake-sort (remove (apply min lst) lst)))))

(define arr '(5 2 8 1 9 3))
(display "Pancake Sort: ")
(display (pancake-sort arr))
(newline)
