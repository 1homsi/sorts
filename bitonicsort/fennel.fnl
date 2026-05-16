(fn compare-and-swap [arr i j direction]
  (when (= direction (> (. arr i) (. arr j)))
    (let [tmp (. arr i)]
      (tset arr i (. arr j))
      (tset arr j tmp))))

(fn bitonic-merge [arr lo cnt direction]
  (when (> cnt 1)
    (let [k (math.floor (/ cnt 2))]
      (for [i lo (- (+ lo k) 1)]
        (compare-and-swap arr i (+ i k) direction))
      (bitonic-merge arr lo k direction)
      (bitonic-merge arr (+ lo k) k direction))))

(fn bitonic-sort [arr lo cnt direction]
  (when (> cnt 1)
    (let [k (math.floor (/ cnt 2))]
      (bitonic-sort arr lo k true)
      (bitonic-sort arr (+ lo k) k false)
      (bitonic-merge arr lo cnt direction))))

(local data [3 7 4 8 6 2 1 5])
(bitonic-sort data 1 (length data) true)
(print (table.concat data " "))
