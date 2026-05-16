(ns selection-sort.core)

(defn selection-sort [coll]
  (loop [remaining coll result []]
    (if (empty? remaining)
      result
      (let [m (apply min remaining)
            idx (.indexOf (clj->js remaining) m)
            rest-coll (vec (concat (subvec (vec remaining) 0 idx)
                                   (subvec (vec remaining) (inc idx))))]
        (recur rest-coll (conj result m))))))
