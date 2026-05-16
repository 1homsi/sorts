(defun comb-sort (arr)
  (let* ((n (length arr))
         (gap n)
         (sorted nil))
    (loop until sorted do
      (setf gap (max 1 (floor gap 1.3)))
      (setf sorted (= gap 1))
      (loop for i from 0 below (- n gap) do
        (when (> (aref arr i) (aref arr (+ i gap)))
          (rotatef (aref arr i) (aref arr (+ i gap)))
          (setf sorted nil))))
    arr))
