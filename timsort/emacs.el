(defvar min-run 32)

(defun insert-val (x lst)
  (cond
    ((null lst) (list x))
    ((<= x (car lst)) (cons x lst))
    (t (cons (car lst) (insert-val x (cdr lst))))))

(defun insertion-sort (lst)
  (if (null lst) lst
    (insert-val (car lst) (insertion-sort (cdr lst)))))

(defun merge-runs (xs ys)
  (cond
    ((null xs) ys)
    ((null ys) xs)
    ((<= (car xs) (car ys))
     (cons (car xs) (merge-runs (cdr xs) ys)))
    (t (cons (car ys) (merge-runs xs (cdr ys))))))

(defun take-n (n lst)
  (if (or (= n 0) (null lst)) nil
    (cons (car lst) (take-n (1- n) (cdr lst)))))

(defun drop-n (n lst)
  (if (or (= n 0) (null lst)) lst
    (drop-n (1- n) (cdr lst))))

(defun chunks-of (n lst)
  (if (null lst) nil
    (cons (take-n n lst) (chunks-of n (drop-n n lst)))))

(defun merge-pairs (runs)
  (cond
    ((null runs) nil)
    ((null (cdr runs)) runs)
    (t (cons (merge-runs (car runs) (cadr runs))
             (merge-pairs (cddr runs))))))

(defun merge-all (runs)
  (if (= 1 (length runs)) (car runs)
    (merge-all (merge-pairs runs))))

(defun timsort (lst)
  (if (null lst) lst
    (merge-all (mapcar #'insertion-sort (chunks-of min-run lst)))))

(message "%s" (timsort '(5 2 8 1 9 3 7 4 6)))
