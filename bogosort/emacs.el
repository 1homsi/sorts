(defun bogosort (lst)
  (if (sortedp lst) lst (bogosort (shuffle lst))))
