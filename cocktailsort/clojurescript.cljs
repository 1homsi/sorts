(defn cocktail-sort [coll]
  (let [arr (js/Array.from (clj->js coll))
        n (.-length arr)]
    (loop [swapped true
           start 0
           end (dec n)]
      (if (not swapped)
        (js->clj arr)
        (let [_ (loop [i start]
                  (when (< i end)
                    (when (> (aget arr i) (aget arr (inc i)))
                      (let [tmp (aget arr i)]
                        (aset arr i (aget arr (inc i)))
                        (aset arr (inc i) tmp)))
                    (recur (inc i))))
              sw1 (some #(> (aget arr %) (aget arr (inc %))) (range start end))
              _ (when sw1
                  (loop [i (dec end)]
                    (when (>= i start)
                      (when (> (aget arr i) (aget arr (inc i)))
                        (let [tmp (aget arr i)]
                          (aset arr i (aget arr (inc i)))
                          (aset arr (inc i) tmp)))
                      (recur (dec i)))))]
          (recur (boolean sw1) (inc start) (dec end)))))))
