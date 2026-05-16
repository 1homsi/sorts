(defn gnome-sort [arr]
  (var i 0)
  (def n (length arr))
  (while (< i n)
    (if (or (= i 0) (>= (arr i) (arr (- i 1))))
        (++ i)
        (do
          (def tmp (arr i))
          (put arr i (arr (- i 1)))
          (put arr (- i 1) tmp)
          (-- i))))
  arr)
