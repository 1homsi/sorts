(fn selection-sort [arr]
  (let [n (length arr)]
    (for [i 1 (- n 1)]
      (var min-idx i)
      (for [j (+ i 1) n]
        (when (< (. arr j) (. arr min-idx))
          (set min-idx j)))
      (let [tmp (. arr i)]
        (tset arr i (. arr min-idx))
        (tset arr min-idx tmp))))
  arr)
