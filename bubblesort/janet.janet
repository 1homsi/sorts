(defn bubble-sort [arr]
  (def a (array ;arr))
  (var n (length a))
  (var swapped true)
  (while swapped
    (set swapped false)
    (for i 0 (- n 1)
      (when (> (a i) (a (+ i 1)))
        (def tmp (a i))
        (put a i (a (+ i 1)))
        (put a (+ i 1) tmp)
        (set swapped true)))
    (-- n))
  a)

(pp (bubble-sort @[64 34 25 12 22 11 90]))
