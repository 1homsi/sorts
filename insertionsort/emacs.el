(defun insert-sorted (x lst)
  (cond ((null lst) (list x))
        ((<= x (car lst)) (cons x lst))
        (t (cons (car lst) (insert-sorted x (cdr lst))))))

(defun insertion-sort (lst)
  (if (null lst)
      nil
    (insert-sorted (car lst) (insertion-sort (cdr lst)))))
