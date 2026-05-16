(ns bubble-sort.core)

(defn bubble-pass [v]
  (loop [i 0 arr v swapped false]
    (if (>= i (dec (count arr)))
      [arr swapped]
      (if (> (nth arr i) (nth arr (inc i)))
        (recur (inc i)
               (assoc arr i (nth arr (inc i)) (inc i) (nth arr i))
               true)
        (recur (inc i) arr swapped)))))

(defn bubble-sort [coll]
  (loop [arr (vec coll)]
    (let [[sorted swapped] (bubble-pass arr)]
      (if swapped (recur sorted) sorted))))

(println (bubble-sort [64 34 25 12 22 11 90]))
