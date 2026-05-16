(defun flip (arr k)
  (let ((left 0) (right k))
    (loop while (< left right) do
      (rotatef (aref arr left) (aref arr right))
      (incf left) (decf right))))

(defun find-max-idx (arr size)
  (let ((max-idx 0))
    (loop for i from 1 below size do
      (when (> (aref arr i) (aref arr max-idx))
        (setf max-idx i)))
    max-idx))

(defun pancake-sort (arr)
  (let ((n (length arr)))
    (loop for size from n downto 2 do
      (let ((max-idx (find-max-idx arr size)))
        (when (/= max-idx (1- size))
          (when (/= max-idx 0) (flip arr max-idx))
          (flip arr (1- size)))))
    arr))

(let ((arr (make-array 7 :initial-contents '(3 6 2 7 4 1 5))))
  (print (pancake-sort arr))
  (terpri))
