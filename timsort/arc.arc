(def insert-val (x lst)
  (if (no lst) (list x)
      (<= x (car lst)) (cons x lst)
      (cons (car lst) (insert-val x (cdr lst)))))

(def insertion-sort (lst)
  (if (no lst) lst
      (insert-val (car lst) (insertion-sort (cdr lst)))))

(def merge-runs (xs ys)
  (if (no xs) ys
      (no ys) xs
      (<= (car xs) (car ys)) (cons (car xs) (merge-runs (cdr xs) ys))
      (cons (car ys) (merge-runs xs (cdr ys)))))

(def chunks-of (n lst)
  (if (no lst) nil
      (cons (firstn n lst) (chunks-of n (nthcdr n lst)))))

(def merge-pairs (runs)
  (if (no runs) nil
      (no (cdr runs)) runs
      (cons (merge-runs (car runs) (cadr runs))
            (merge-pairs (cddr runs)))))

(def merge-all (runs)
  (if (is (len runs) 1) (car runs)
      (merge-all (merge-pairs runs))))

(def timsort (lst)
  (if (no lst) lst
      (merge-all (map insertion-sort (chunks-of 32 lst)))))

(prn (timsort '(5 2 8 1 9 3 7 4 6)))
