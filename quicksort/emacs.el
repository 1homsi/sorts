(defun quicksort (lst)
  (if (or (null lst) (null (cdr lst)))
      lst
    (let* ((pivot (car lst))
           (rest (cdr lst))
           (left (seq-filter (lambda (x) (<= x pivot)) rest))
           (right (seq-filter (lambda (x) (> x pivot)) rest)))
      (append (quicksort left) (list pivot) (quicksort right)))))

(message "%s" (quicksort '(3 6 8 10 1 2 1)))
