(defn merge [left right]
  (cond
    (empty? left) right
    (empty? right) left
    (<= (first left) (first right))
    (array/concat @[(first left)] (merge (array/slice left 1) right))
    (array/concat @[(first right)] (merge left (array/slice right 1)))))

(defn merge-sort [arr]
  (let [n (length arr)]
    (if (<= n 1)
      arr
      (let [mid (math/floor (/ n 2))
            left (merge-sort (array/slice arr 0 mid))
            right (merge-sort (array/slice arr mid))]
        (merge left right)))))

(print (merge-sort @[38 27 43 3 9 82 10]))
