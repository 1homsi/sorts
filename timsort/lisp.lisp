(defvar *min-run* 32)

(defun insertion-sort (lst)
  (labels ((insert (x sorted)
             (cond
               ((null sorted) (list x))
               ((<= x (car sorted)) (cons x sorted))
               (t (cons (car sorted) (insert x (cdr sorted)))))))
    (reduce (lambda (sorted x) (insert x sorted)) lst :initial-value nil)))

(defun merge-runs (xs ys)
  (cond
    ((null xs) ys)
    ((null ys) xs)
    ((<= (car xs) (car ys))
     (cons (car xs) (merge-runs (cdr xs) ys)))
    (t
     (cons (car ys) (merge-runs xs (cdr ys))))))

(defun chunks-of (n lst)
  (if (null lst)
      nil
      (cons (subseq lst 0 (min n (length lst)))
            (chunks-of n (nthcdr (min n (length lst)) lst)))))

(defun merge-pairs (runs)
  (cond
    ((null runs) nil)
    ((null (cdr runs)) runs)
    (t (cons (merge-runs (car runs) (cadr runs))
             (merge-pairs (cddr runs))))))

(defun merge-all (runs)
  (if (= 1 (length runs))
      (car runs)
      (merge-all (merge-pairs runs))))

(defun timsort (lst)
  (if (null lst)
      lst
      (merge-all (mapcar #'insertion-sort (chunks-of *min-run* lst)))))

(print (timsort '(5 2 8 1 9 3 7 4 6)))
