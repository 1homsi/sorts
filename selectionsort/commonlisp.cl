(defun selection-sort (arr)
  (let ((n (length arr)))
    (dotimes (i n arr)
      (let ((min-idx i))
        (loop for j from (1+ i) below n do
          (when (< (aref arr j) (aref arr min-idx))
            (setf min-idx j)))
        (rotatef (aref arr i) (aref arr min-idx))))))
