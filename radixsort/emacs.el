(defun get-digit (x exp)
  (mod (/ x exp) 10))

(defun counting-sort (arr exp)
  (apply #'append
    (mapcar (lambda (d)
              (seq-filter (lambda (x) (= (get-digit x exp) d)) arr))
            (number-sequence 0 9))))

(defun radix-sort (arr)
  (if (null arr) arr
    (let* ((max-val (apply #'max arr))
           (result arr)
           (exp 1))
      (while (> (/ max-val exp) 0)
        (setq result (counting-sort result exp))
        (setq exp (* exp 10)))
      result)))

(message "%S" (radix-sort '(170 45 75 90 802 24 2 66)))
