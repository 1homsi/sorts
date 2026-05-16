(defun quicksort (lst / pivot rest left right)
  (if (or (null lst) (null (cdr lst)))
    lst
    (progn
      (setq pivot (car lst)
            rest (cdr lst)
            left (vl-remove-if-not '(lambda (x) (<= x pivot)) rest)
            right (vl-remove-if-not '(lambda (x) (> x pivot)) rest))
      (append (quicksort left) (list pivot) (quicksort right)))))

(princ (quicksort '(3 6 8 10 1 2 1)))
(princ)
