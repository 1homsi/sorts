(defn compare-and-swap [arr i j direction]
  (let [ai (get arr i) aj (get arr j)]
    (when (= direction (> ai aj))
      (setv (get arr i) aj)
      (setv (get arr j) ai))))

(defn bitonic-merge [arr lo cnt direction]
  (when (> cnt 1)
    (let [k (// cnt 2)]
      (for [i (range lo (+ lo k))]
        (compare-and-swap arr i (+ i k) direction))
      (bitonic-merge arr lo k direction)
      (bitonic-merge arr (+ lo k) k direction))))

(defn bitonic-sort [arr lo cnt direction]
  (when (> cnt 1)
    (let [k (// cnt 2)]
      (bitonic-sort arr lo k True)
      (bitonic-sort arr (+ lo k) k False)
      (bitonic-merge arr lo cnt direction))))

(setv data [3 7 4 8 6 2 1 5])
(bitonic-sort data 0 (len data) True)
(print data)
