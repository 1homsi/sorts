(ns bitonic-sort)

(defn compare-and-swap [arr i j direction]
  (if (= direction (> (nth arr i) (nth arr j)))
    (-> arr
        (assoc i (nth arr j))
        (assoc j (nth arr i)))
    arr))

(defn bitonic-merge [arr lo cnt direction]
  (if (<= cnt 1)
    arr
    (let [k (quot cnt 2)
          arr (reduce (fn [a i] (compare-and-swap a i (+ i k) direction))
                      arr (range lo (+ lo k)))
          arr (bitonic-merge arr lo k direction)
          arr (bitonic-merge arr (+ lo k) k direction)]
      arr)))

(defn bitonic-sort [arr lo cnt direction]
  (if (<= cnt 1)
    arr
    (let [k (quot cnt 2)
          arr (bitonic-sort arr lo k true)
          arr (bitonic-sort arr (+ lo k) k false)
          arr (bitonic-merge arr lo cnt direction)]
      arr)))

(def data [3 7 4 8 6 2 1 5])
(println (bitonic-sort (vec data) 0 (count data) true))
