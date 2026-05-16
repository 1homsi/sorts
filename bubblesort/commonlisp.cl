(defun bubble-sort (lst)
  (let ((arr (coerce lst 'vector))
        (n (length lst)))
    (loop
      (let ((swapped nil))
        (loop for i from 0 below (1- n) do
          (when (> (aref arr i) (aref arr (1+ i)))
            (rotatef (aref arr i) (aref arr (1+ i)))
            (setf swapped t)))
        (decf n)
        (unless swapped (return))))
    (coerce arr 'list)))

(print (bubble-sort '(64 34 25 12 22 11 90)))
