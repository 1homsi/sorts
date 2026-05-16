(ns timsort.core)

(def min-run 32)

(defn insert-val [x coll]
  (cond
    (empty? coll) [x]
    (<= x (first coll)) (into [x] coll)
    :else (into [(first coll)] (insert-val x (rest coll)))))

(defn insertion-sort [coll]
  (reduce (fn [sorted x] (insert-val x sorted)) [] coll))

(defn merge-runs [xs ys]
  (cond
    (empty? xs) ys
    (empty? ys) xs
    (<= (first xs) (first ys))
    (into [(first xs)] (merge-runs (rest xs) ys))
    :else (into [(first ys)] (merge-runs xs (rest ys)))))

(defn chunks-of [n coll]
  (if (empty? coll) []
    (into [(take n coll)] (chunks-of n (drop n coll)))))

(defn merge-pairs [runs]
  (cond
    (empty? runs) []
    (= 1 (count runs)) runs
    :else (into [(merge-runs (first runs) (second runs))]
                (merge-pairs (drop 2 runs)))))

(defn merge-all [runs]
  (if (= 1 (count runs)) (first runs)
    (merge-all (merge-pairs runs))))

(defn timsort [coll]
  (if (empty? coll) coll
    (->> (chunks-of min-run coll)
         (map insertion-sort)
         merge-all)))
