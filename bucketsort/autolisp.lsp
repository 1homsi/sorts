(defun insert-sorted (x lst)
  (cond ((null lst) (list x))
        ((<= x (car lst)) (cons x lst))
        (T (cons (car lst) (insert-sorted x (cdr lst))))))

(defun insertion-sort (lst)
  (if (null lst)
    nil
    (insert-sorted (car lst) (insertion-sort (cdr lst)))))

(defun get-idx (num mn mx n)
  (min (1- n)
       (fix (* (/ (- num mn) (+ (- mx mn) 1.0)) n))))

(defun bucket-sort (arr)
  (if (null arr)
    arr
    (let* ((n (length arr))
           (mn (apply 'min arr))
           (mx (apply 'max arr))
           (buckets (make-list n nil)))
      (foreach num arr
        (let* ((idx (get-idx num mn mx n))
               (old (nth idx buckets)))
          (setf (nth idx buckets) (append old (list num)))))
      (apply 'append (mapcar 'insertion-sort buckets)))))

(print (bucket-sort '(0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68)))
