(ns counting-sort.core)

(defn counting-sort [arr]
  (if (empty? arr)
    arr
    (let [min-val (apply min arr)
          max-val (apply max arr)
          range-val (- max-val min-val -1)
          count (reduce (fn [acc x]
                          (update acc (- x min-val) inc))
                        (vec (repeat range-val 0)) arr)
          count (reduce (fn [acc i]
                          (update acc i + (acc (dec i))))
                        count (range 1 range-val))
          output (transient (vec (repeat (count arr) 0)))
          cnt (transient count)]
      (doseq [x (reverse arr)]
        (let [i (- x min-val)
              pos (dec (nth cnt i))]
          (assoc! cnt i pos)
          (assoc! output pos x)))
      (persistent! output))))

(println (counting-sort [4 2 2 8 3 3 1]))
