(defn selection-sort [arr]
  (setv n (len arr))
  (for [i (range n)]
    (setv min-idx i)
    (for [j (range (+ i 1) n)]
      (when (< (get arr j) (get arr min-idx))
        (setv min-idx j)))
    (setv tmp (get arr i))
    (setv (get arr i) (get arr min-idx))
    (setv (get arr min-idx) tmp))
  arr)
