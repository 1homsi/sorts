(fn gnome-sort [arr]
  (var i 0)
  (let [n (length arr)]
    (while (< i n)
      (if (or (= i 0) (>= (. arr (+ i 1)) (. arr i)))
          (set i (+ i 1))
          (do
            (let [tmp (. arr (+ i 1))]
              (tset arr (+ i 1) (. arr i))
              (tset arr i tmp))
            (set i (- i 1))))))
  arr)
