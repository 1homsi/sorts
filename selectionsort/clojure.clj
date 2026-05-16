(defn selection-sort [coll]
  (loop [remaining coll result []]
    (if (empty? remaining)
      result
      (let [m (apply min remaining)]
        (recur (let [idx (.indexOf (vec remaining) m)]
                 (vec (concat (subvec (vec remaining) 0 idx)
                              (subvec (vec remaining) (inc idx)))))
               (conj result m))))))
