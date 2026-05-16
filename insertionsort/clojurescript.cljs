(defn insert [x sorted]
  (let [[less greater] (split-with #(<= % x) sorted)]
    (concat less [x] greater)))

(defn insertion-sort [coll]
  (reduce (fn [acc x] (insert x acc)) [] coll))
