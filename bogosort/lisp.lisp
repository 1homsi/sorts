(defun is-sorted (lst)
  (or (null lst) (null (cdr lst))
      (and (<= (car lst) (cadr lst))
           (is-sorted (cdr lst)))))

(defun shuffle (lst)
  (let ((vec (coerce lst 'vector)))
    (loop for i from (1- (length vec)) downto 1
          do (let ((j (random (1+ i))))
               (rotatef (aref vec i) (aref vec j))))
    (coerce vec 'list)))

(defun bogosort (lst)
  (loop until (is-sorted lst)
        do (setf lst (shuffle lst)))
  lst)

(print (bogosort '(3 1 4 1 5 9 2 6)))
