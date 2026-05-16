(defn counting-sort [arr]
  (if (empty? arr)
    arr
    (let [min-val (min ;arr)
          max-val (max ;arr)
          range (+ (- max-val min-val) 1)
          count (array/new-filled range 0)
          n (length arr)
          output (array/new-filled n 0)]
      (each v arr
        (let [i (- v min-val)]
          (put count i (+ (count i) 1))))
      (for i 1 range
        (put count i (+ (count i) (count (- i 1)))))
      (for i (- n 1) -1 -1
        (let [v (arr i)
              idx (- v min-val)
              pos (- (count idx) 1)]
          (put count idx pos)
          (put output pos v)))
      output)))

(print (counting-sort @[4 2 2 8 3 3 1]))
