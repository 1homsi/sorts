(defn selection-sort [arr]
  (def n (length arr))
  (for i 0 n
    (var min-idx i)
    (for j (+ i 1) n
      (when (< (arr j) (arr min-idx))
        (set min-idx j)))
    (def tmp (arr i))
    (put arr i (arr min-idx))
    (put arr min-idx tmp))
  arr)
