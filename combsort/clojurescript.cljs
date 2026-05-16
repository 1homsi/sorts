(defn comb-sort [arr]
  (let [n (count arr)
        a (js/Array.from (clj->js arr))]
    (loop [gap n sorted false]
      (let [new-gap (max 1 (js/Math.floor (/ gap 1.3)))
            new-sorted (= new-gap 1)
            changed (reduce (fn [ch i]
                              (if (> (aget a i) (aget a (+ i new-gap)))
                                (let [tmp (aget a i)]
                                  (aset a i (aget a (+ i new-gap)))
                                  (aset a (+ i new-gap) tmp)
                                  true)
                                ch))
                            false
                            (range (- n new-gap)))]
        (if (and (= new-gap 1) (not changed))
          (js->clj a)
          (recur new-gap (and new-sorted (not changed))))))))
