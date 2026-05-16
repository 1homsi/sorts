(defun counting-sort (arr exp)
  (let* ((n (length arr))
         (count (make-array 10 :initial-element 0))
         (output (make-array n :initial-element 0)))
    (loop for x across arr do
          (incf (aref count (mod (floor x exp) 10))))
    (loop for i from 1 to 9 do
          (incf (aref count i) (aref count (1- i))))
    (loop for i from (1- n) downto 0 do
          (let ((idx (mod (floor (aref arr i) exp) 10)))
            (decf (aref count idx))
            (setf (aref output (aref count idx)) (aref arr i))))
    (loop for i from 0 to (1- n) do
          (setf (aref arr i) (aref output i)))
    arr))

(defun radix-sort (arr)
  (when (zerop (length arr)) (return-from radix-sort arr))
  (let ((max (reduce #'max arr))
        (exp 1))
    (loop while (> (floor max exp) 0) do
          (counting-sort arr exp)
          (setf exp (* exp 10))))
  arr)

(let ((arr (make-array 8 :initial-contents '(170 45 75 90 802 24 2 66))))
  (print (radix-sort arr)))
