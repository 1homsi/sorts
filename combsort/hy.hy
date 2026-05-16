(defn comb-sort [arr]
  (setv n (len arr)
        gap n
        sorted False)
  (while (not sorted)
    (setv gap (max 1 (int (/ gap 1.3))))
    (when (= gap 1)
      (setv sorted True))
    (for [i (range (- n gap))]
      (when (> (get arr i) (get arr (+ i gap)))
        (setv tmp (get arr i))
        (setv (get arr i) (get arr (+ i gap)))
        (setv (get arr (+ i gap)) tmp)
        (setv sorted False))))
  arr)
