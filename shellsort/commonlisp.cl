(defun shellsort (arr)
    (let* ((n (length arr))
           (gap (floor n 2)))
        (loop while (> gap 0) do
            (loop for i from gap below n do
                (let ((temp (aref arr i)))
                    (loop for j = i then (- j gap)
                          while (and (>= j gap) (> (aref arr (- j gap)) temp))
                          do (setf (aref arr j) (aref arr (- j gap))))
                    (setf (aref arr j) temp)))
            (setf gap (floor gap 2)))
        arr))
