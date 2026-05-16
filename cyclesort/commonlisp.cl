(defun cycle-sort (arr)
  (let ((n (length arr))
        (writes 0))
    (dotimes (cycle-start (1- n))
      (let ((item (aref arr cycle-start))
            (pos cycle-start))
        (loop for i from (1+ cycle-start) below n
              when (< (aref arr i) item) do (incf pos))
        (unless (= pos cycle-start)
          (loop while (= item (aref arr pos)) do (incf pos))
          (rotatef (aref arr pos) item)
          (incf writes)
          (loop while (/= pos cycle-start) do
            (setf pos cycle-start)
            (loop for i from (1+ cycle-start) below n
                  when (< (aref arr i) item) do (incf pos))
            (loop while (= item (aref arr pos)) do (incf pos))
            (rotatef (aref arr pos) item)
            (incf writes)))))
    writes))

(let ((arr (make-array 5 :initial-contents '(5 4 3 2 1))))
  (cycle-sort arr)
  (print arr))
