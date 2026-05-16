(defun selection-sort (lst)
  (if (null lst)
      '()
      (let ((min-val (apply #'min lst)))
        (cons min-val
              (selection-sort (remove min-val lst :count 1))))))
