(defn merge-lists [left right]
  (cond
    (empty? left) right
    (empty? right) left
    (<= (first left) (first right))
    (cons (first left) (merge-lists (rest left) right))
    :else
    (cons (first right) (merge-lists left (rest right)))))

(defn merge-sort [coll]
  (if (<= (count coll) 1)
    coll
    (let [mid (quot (count coll) 2)
          v (vec coll)
          left (subvec v 0 mid)
          right (subvec v mid)]
      (merge-lists (merge-sort left) (merge-sort right)))))

(println (merge-sort [38 27 43 3 9 82 10]))
