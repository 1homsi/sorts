(defn counting-sort [arr]
  (if (empty? arr)
    arr
    (let [mn (apply min arr)
          mx (apply max arr)
          rng (- mx mn -1)
          count (reduce (fn [acc x] (update acc (- x mn) inc))
                        (vec (repeat rng 0)) arr)
          count (reduce (fn [acc i] (update acc i + (acc (dec i))))
                        count (range 1 rng))
          output (transient (vec (repeat (count arr) 0)))
          count (transient count)]
      (doseq [x (reverse arr)]
        (let [i (- x mn)
              pos (dec (nth count i))]
          (assoc! count i pos)
          (assoc! output pos x)))
      (persistent! output))))

(println (counting-sort [4 2 2 8 3 3 1]))
