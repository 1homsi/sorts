(fn counting-sort [arr]
  (if (= (length arr) 0)
    arr
    (let [min-val (math.min (table.unpack arr))
          max-val (math.max (table.unpack arr))
          range (+ (- max-val min-val) 1)
          count (fcollect [i 1 range] 0)
          n (length arr)
          output (fcollect [i 1 n] 0)]
      (each [_ v (ipairs arr)]
        (tset count (+ (- v min-val) 1)
              (+ (. count (+ (- v min-val) 1)) 1)))
      (for [i 2 range]
        (tset count i (+ (. count i) (. count (- i 1)))))
      (for [i n 1 -1]
        (let [v (. arr i)
              idx (+ (- v min-val) 1)
              pos (. count idx)]
          (tset count idx (- pos 1))
          (tset output pos v)))
      output)))

(let [result (counting-sort [4 2 2 8 3 3 1])]
  (each [_ v (ipairs result)] (io.write (tostring v) " "))
  (print))
