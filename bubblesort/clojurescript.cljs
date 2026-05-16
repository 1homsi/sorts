(ns bubble-sort.core)

(defn bubble-pass [arr]
  (loop [i 0 a arr swapped false]
    (if (>= i (dec (count a)))
      [a swapped]
      (if (> (nth a i) (nth a (inc i)))
        (recur (inc i)
               (assoc a i (nth a (inc i)) (inc i) (nth a i))
               true)
        (recur (inc i) a swapped)))))

(defn bubble-sort [coll]
  (loop [arr (vec coll)]
    (let [[sorted swapped] (bubble-pass arr)]
      (if swapped (recur sorted) sorted))))

(println (bubble-sort [64 34 25 12 22 11 90]))
