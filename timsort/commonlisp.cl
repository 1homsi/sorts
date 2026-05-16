(defparameter *min-run* 32)

(defun insertion-sort-vec (vec left right)
  (loop for i from (1+ left) to right do
    (let ((key (aref vec i))
          (j (1- i)))
      (loop while (and (>= j left) (> (aref vec j) key)) do
        (setf (aref vec (1+ j)) (aref vec j))
        (decf j))
      (setf (aref vec (1+ j)) key)))
  vec)

(defun merge-vec (vec left mid right)
  (let* ((ln (- mid left -1))
         (rn (- right mid))
         (lp (subseq vec left (1+ mid)))
         (rp (subseq vec (1+ mid) (1+ right))))
    (loop with i = 0 and j = 0 and k = left
          while (and (< i ln) (< j rn)) do
      (if (<= (aref lp i) (aref rp j))
          (progn (setf (aref vec k) (aref lp i)) (incf i))
          (progn (setf (aref vec k) (aref rp j)) (incf j)))
      (incf k)
      finally
        (loop while (< i ln) do (setf (aref vec k) (aref lp i)) (incf i) (incf k))
        (loop while (< j rn) do (setf (aref vec k) (aref rp j)) (incf j) (incf k))))
  vec)

(defun timsort (vec)
  (let ((n (length vec)))
    (loop for i from 0 below n by *min-run* do
      (insertion-sort-vec vec i (min (+ i *min-run* -1) (1- n))))
    (loop for size = *min-run* then (* size 2)
          while (< size n) do
      (loop for left from 0 below n by (* 2 size) do
        (let ((mid (min (+ left size -1) (1- n)))
              (right (min (+ left (* 2 size) -1) (1- n))))
          (when (< mid right)
            (merge-vec vec left mid right))))))
  vec)

(let ((arr (vector 5 2 8 1 9 3 7 4 6)))
  (print (timsort arr)))
