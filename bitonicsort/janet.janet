(defn compare-and-swap [arr i j direction]
  (let [ai (arr i) aj (arr j)]
    (when (= direction (> ai aj))
      (put arr i aj)
      (put arr j ai))))

(defn bitonic-merge [arr lo cnt direction]
  (when (> cnt 1)
    (let [k (div cnt 2)]
      (for i lo (+ lo k)
        (compare-and-swap arr i (+ i k) direction))
      (bitonic-merge arr lo k direction)
      (bitonic-merge arr (+ lo k) k direction))))

(defn bitonic-sort [arr lo cnt direction]
  (when (> cnt 1)
    (let [k (div cnt 2)]
      (bitonic-sort arr lo k true)
      (bitonic-sort arr (+ lo k) k false)
      (bitonic-merge arr lo cnt direction))))

(def data @[3 7 4 8 6 2 1 5])
(bitonic-sort data 0 (length data) true)
(print data)
