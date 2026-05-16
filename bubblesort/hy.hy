(defn bubble-sort [lst]
  (setv arr (list lst))
  (setv n (len arr))
  (setv swapped True)
  (while swapped
    (setv swapped False)
    (for [i (range (- n 1))]
      (when (> (get arr i) (get arr (+ i 1)))
        (setv tmp (get arr i))
        (setv (get arr i) (get arr (+ i 1)))
        (setv (get arr (+ i 1)) tmp)
        (setv swapped True)))
    (setv n (- n 1)))
  arr)

(print (bubble-sort [64 34 25 12 22 11 90]))
