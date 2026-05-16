(defn gnome-sort [arr]
  (setv i 0)
  (setv n (len arr))
  (while (< i n)
    (if (or (= i 0) (>= (get arr i) (get arr (- i 1))))
        (setv i (+ i 1))
        (do
          (setv tmp (get arr i))
          (setv (get arr i) (get arr (- i 1)))
          (setv (get arr (- i 1)) tmp)
          (setv i (- i 1)))))
  arr)
