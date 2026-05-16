(def gnome-sort (arr)
  (let i 0
    (let n (len arr)
      (while (< i n)
        (if (or (is i 0) (>= (arr i) (arr (- i 1))))
            (++ i)
            (do
              (let tmp (arr i)
                (= (arr i) (arr (- i 1)))
                (= (arr (- i 1)) tmp))
              (-- i))))))
  arr)
