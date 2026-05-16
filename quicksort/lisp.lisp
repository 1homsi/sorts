(defun quicksort (lst)
  (if (null lst)
      nil
      (let* ((pivot (car lst))
             (rest (cdr lst))
             (left (remove-if-not #'(lambda (x) (<= x pivot)) rest))
             (right (remove-if-not #'(lambda (x) (> x pivot)) rest)))
        (append (quicksort left) (list pivot) (quicksort right)))))

(print (quicksort '(3 6 8 10 1 2 1)))
