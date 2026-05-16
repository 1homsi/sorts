(defmodule selection-sort
  (export (sort 1)))

(defun sort
  ([`()] `())
  ([lst]
   (let* ((m (lists:min lst))
          (rest (lists:delete m lst)))
     (cons m (sort rest)))))
