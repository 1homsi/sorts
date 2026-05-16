(ns timsort.core)

(def min-run 32)

(defn insertion-sort [coll]
  (reduce (fn [sorted x]
            (let [[less greater] (split-with #(<= % x) sorted)]
              (concat less [x] greater)))
          [] coll))

(defn merge-runs [xs ys]
  (cond
    (empty? xs) ys
    (empty? ys) xs
    (<= (first xs) (first ys)) (cons (first xs) (merge-runs (rest xs) ys))
    :else (cons (first ys) (merge-runs xs (rest ys)))))

(defn merge-pairs [runs]
  (cond
    (empty? runs) []
    (= 1 (count runs)) runs
    :else (cons (merge-runs (first runs) (second runs))
                (merge-pairs (drop 2 runs)))))

(defn merge-all [runs]
  (if (= 1 (count runs))
    (first runs)
    (recur (merge-pairs runs))))

(defn timsort [coll]
  (if (empty? coll)
    coll
    (->> (partition-all min-run coll)
         (map insertion-sort)
         merge-all)))
