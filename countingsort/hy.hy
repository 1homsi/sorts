(defn counting-sort [arr]
  (if (= (len arr) 0)
    arr
    (let [min-val (min arr)
          max-val (max arr)
          range-val (+ (- max-val min-val) 1)
          count (list (* [0] range-val))
          n (len arr)
          output (list (* [0] n))]
      (for [v arr]
        (setv (get count (- v min-val))
              (+ (get count (- v min-val)) 1)))
      (for [i (range 1 range-val)]
        (setv (get count i)
              (+ (get count i) (get count (- i 1)))))
      (for [i (range (- n 1) -1 -1)]
        (let [v (get arr i)
              idx (- v min-val)
              pos (- (get count idx) 1)]
          (setv (get count idx) pos)
          (setv (get output pos) v)))
      output)))

(print (counting-sort [4 2 2 8 3 3 1]))
