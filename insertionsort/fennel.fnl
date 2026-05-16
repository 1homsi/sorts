(fn insert [x lst]
  (if (= (length lst) 0)
      [x]
      (let [h (. lst 1)
            t (table.move lst 2 (length lst) 1 [])]
        (if (<= x h)
            (do (table.insert lst 1 x) lst)
            (do (table.insert t 1 h) (insert x t))))))

(fn insertion-sort [lst]
  (var result [])
  (each [_ v (ipairs lst)]
    (set result (insert v result)))
  result)
