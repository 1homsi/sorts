(defun merge-lists (left right)
  (cond
    ((null left) right)
    ((null right) left)
    ((<= (car left) (car right))
     (cons (car left) (merge-lists (cdr left) right)))
    (t
     (cons (car right) (merge-lists left (cdr right))))))

(defun take-n (lst n)
  (if (or (= n 0) (null lst))
      nil
      (cons (car lst) (take-n (cdr lst) (1- n)))))

(defun drop-n (lst n)
  (if (or (= n 0) (null lst))
      lst
      (drop-n (cdr lst) (1- n))))

(defun merge-sort (lst)
  (if (<= (length lst) 1)
      lst
      (let* ((mid (/ (length lst) 2))
             (left (take-n lst mid))
             (right (drop-n lst mid)))
        (merge-lists (merge-sort left) (merge-sort right)))))

(print (merge-sort '(38 27 43 3 9 82 10)))
