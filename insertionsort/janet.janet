(defn insert [x lst]
  (if (empty? lst)
    [x]
    (let [h (first lst) t (tuple/slice lst 1)]
      (if (<= x h)
        (tuple x h ;t)
        (tuple h ;(insert x t))))))

(defn insertion-sort [lst]
  (if (empty? lst)
    []
    (insert (first lst) (insertion-sort (tuple/slice lst 1)))))
