(defun merge-lists (left right)
  (cond ((null left) right)
        ((null right) left)
        ((< (car left) (car right))
         (cons (car left) (merge-lists (cdr left) right)))
        (t
         (cons (car right) (merge-lists left (cdr right))))))

(defun merge-sort (lst)
  (if (<= (length lst) 1)
      lst
      (let* ((mid (floor (length lst) 2))
             (left (subseq lst 0 mid))
             (right (subseq lst mid)))
        (merge-lists (merge-sort left) (merge-sort right)))))

(print (merge-sort '(38 27 43 3 9 82 10)))
