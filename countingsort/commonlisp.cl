(defun counting-sort (arr)
  (if (null arr) arr
      (let* ((min-val (apply #'min arr))
             (max-val (apply #'max arr))
             (range (1+ (- max-val min-val)))
             (count (make-array range :initial-element 0))
             (n (length arr))
             (output (make-array n))
             (vec (coerce arr 'vector)))
        (loop for v across vec do
          (incf (aref count (- v min-val))))
        (loop for i from 1 below range do
          (incf (aref count i) (aref count (1- i))))
        (loop for i from (1- n) downto 0 do
          (let* ((v (aref vec i))
                 (idx (- v min-val)))
            (decf (aref count idx))
            (setf (aref output (aref count idx)) v)))
        (coerce output 'list))))

(print (counting-sort '(4 2 2 8 3 3 1)))
