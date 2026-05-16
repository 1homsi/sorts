(defn comb-sort [v]
  (let [arr (int-array v)
        n (alength arr)]
    (loop [gap n sorted false]
      (let [new-gap (max 1 (int (/ gap 1.3)))
            new-sorted (if (= new-gap 1) true false)
            changed (reduce (fn [ch i]
                              (if (> (aget arr i) (aget arr (+ i new-gap)))
                                (let [tmp (aget arr i)]
                                  (aset arr i (aget arr (+ i new-gap)))
                                  (aset arr (+ i new-gap) tmp)
                                  true)
                                ch))
                            false
                            (range (- n new-gap)))]
        (if (and (= new-gap 1) (not changed))
          (vec arr)
          (recur new-gap new-sorted))))))
