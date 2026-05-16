(def insert (x lst)
  (if (no lst) (list x)
      (<= x (car lst)) (cons x lst)
      (cons (car lst) (insert x (cdr lst)))))

(def insertion-sort (lst)
  (if (no lst) nil
      (insert (car lst) (insertion-sort (cdr lst)))))
