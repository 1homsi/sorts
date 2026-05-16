(defn cocktail-sort [coll]
  (let [arr (int-array coll)
        n (count arr)]
    (loop [swapped true
           start 0
           end (dec n)]
      (if (not swapped)
        (seq arr)
        (let [_ (loop [i start]
                  (when (< i end)
                    (when (> (aget arr i) (aget arr (inc i)))
                      (let [tmp (aget arr i)]
                        (aset arr i (aget arr (inc i)))
                        (aset arr (inc i) tmp)))
                    (recur (inc i))))
              sw1 (some #(> (aget arr %) (aget arr (inc %))) (range start end))
              _ (loop [i (dec end)]
                  (when (>= i start)
                    (when (> (aget arr i) (aget arr (inc i)))
                      (let [tmp (aget arr i)]
                        (aset arr i (aget arr (inc i)))
                        (aset arr (inc i) tmp)))
                    (recur (dec i))))]
          (recur (boolean (some #(> (aget arr %) (aget arr (inc %)))
                                (concat (range start end) (range start (dec end)))))
                 (inc start)
                 (dec end)))))))
