(defn insert [x lst]
  (if (empty? lst)
    [x]
    (let [h (first lst) t (list (rest lst))]
      (if (<= x h)
        (+ [x] [h] t)
        (+ [h] (insert x t))))))

(defn insertion-sort [lst]
  (if (empty? lst)
    []
    (insert (first lst) (insertion-sort (list (rest lst))))))
