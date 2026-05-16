(defn insertion-sort [bucket]
  (reduce (fn [acc x]
            (let [idx (count (take-while #(<= % x) acc))]
              (concat (take idx acc) [x] (drop idx acc))))
          [] bucket))

(defn bucket-sort [arr]
  (if (empty? arr)
    arr
    (let [n (count arr)
          mn (apply min arr)
          mx (apply max arr)
          get-idx (fn [x] (min (dec n) (int (* (/ (- x mn) (+ (- mx mn) 1)) n))))
          buckets (reduce (fn [bs x]
                            (update bs (get-idx x) conj x))
                          (vec (repeat n [])) arr)]
      (mapcat insertion-sort buckets))))

(println (bucket-sort [0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68]))
