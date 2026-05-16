(def merge (left right)
  (if (no left) right
      (no right) left
      (<= (car left) (car right))
      (cons (car left) (merge (cdr left) right))
      (cons (car right) (merge left (cdr right)))))

(def merge-sort (lst)
  (if (<= (len lst) 1) lst
      (let mid (trunc (/ (len lst) 2))
        (merge (merge-sort (firstn mid lst))
               (merge-sort (nthcdr mid lst))))))

(prn (merge-sort '(38 27 43 3 9 82 10)))
