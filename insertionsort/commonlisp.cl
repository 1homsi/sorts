(defun insert-sorted (x lst)
  (cond ((null lst) (list x))
        ((<= x (car lst)) (cons x lst))
        (t (cons (car lst) (insert-sorted x (cdr lst))))))

(defun insertion-sort (lst)
  (reduce (lambda (acc x) (insert-sorted x acc)) lst :initial-value nil))
