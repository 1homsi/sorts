(fn insert-sorted [x lst]
  (if (= (length lst) 0)
    [x]
    (let [h (. lst 1)
          t (table.unpack lst 2)]
      (if (<= x h)
        (doto [x] (table.insert 2 h) )
        (do
          (table.insert (insert-sorted x [t]) 1 h)
          (insert-sorted x [t]))))))

(fn insertion-sort [lst]
  (if (= (length lst) 0)
    []
    (insert-sorted (. lst 1) (insertion-sort [(table.unpack lst 2)]))))

(fn bucket-sort [arr]
  (let [n (length arr)]
    (if (= n 0)
      arr
      (let [min-v (accumulate [m (. arr 1) _ v (ipairs arr)] (math.min m v))
            max-v (accumulate [m (. arr 1) _ v (ipairs arr)] (math.max m v))
            buckets (fcollect [_ 1 n] [])]
        (each [_ num (ipairs arr)]
          (let [idx (+ 1 (math.min (- n 1)
                           (math.floor (/ (* (- num min-v) n)
                                          (+ (- max-v min-v) 1)))))]
            (table.insert (. buckets idx) num)))
        (let [result []]
          (each [_ b (ipairs buckets)]
            (each [_ v (ipairs (insertion-sort b))]
              (table.insert result v)))
          result)))))

(print (table.concat (bucket-sort [0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68]) " "))
