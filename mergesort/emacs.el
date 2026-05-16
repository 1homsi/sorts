(defun merge-lists (left right)
  (cond ((null left) right)
        ((null right) left)
        ((<= (car left) (car right))
         (cons (car left) (merge-lists (cdr left) right)))
        (t
         (cons (car right) (merge-lists left (cdr right))))))

(defun merge-sort (lst)
  (if (<= (length lst) 1)
      lst
    (let* ((mid (/ (length lst) 2))
           (left (seq-take lst mid))
           (right (seq-drop lst mid)))
      (merge-lists (merge-sort left) (merge-sort right)))))

(message "%s" (merge-sort '(38 27 43 3 9 82 10)))
