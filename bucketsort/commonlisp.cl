(defun insertion-sort (lst)
  (if (null lst)
      nil
      (insert-sorted (car lst) (insertion-sort (cdr lst)))))

(defun insert-sorted (x lst)
  (cond ((null lst) (list x))
        ((<= x (car lst)) (cons x lst))
        (t (cons (car lst) (insert-sorted x (cdr lst))))))

(defun bucket-sort (arr)
  (let* ((n (length arr))
         (mn (apply #'min arr))
         (mx (apply #'max arr))
         (buckets (make-array n :initial-element '())))
    (dolist (num arr)
      (let ((idx (min (1- n) (floor (* (/ (- num mn) (+ (- mx mn) 1.0)) n)))))
        (setf (aref buckets idx) (append (aref buckets idx) (list num)))))
    (let ((result '()))
      (dotimes (i n result)
        (setf result (append result (insertion-sort (aref buckets i))))))))

(format t "~a~%" (bucket-sort '(0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68)))
