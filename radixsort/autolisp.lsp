(defun get-digit (x exp)
  (rem (/ x exp) 10))

(defun counting-sort (arr exp / result d x)
  (setq result '())
  (setq d 0)
  (while (< d 10)
    (foreach x arr
      (if (= (get-digit x exp) d)
        (setq result (append result (list x)))))
    (setq d (1+ d)))
  result)

(defun radix-sort (arr / max-val exp result)
  (if (null arr)
    arr
    (progn
      (setq max-val (apply 'max arr))
      (setq exp 1)
      (setq result arr)
      (while (> (/ max-val exp) 0)
        (setq result (counting-sort result exp))
        (setq exp (* exp 10)))
      result)))

(print (radix-sort '(170 45 75 90 802 24 2 66)))
