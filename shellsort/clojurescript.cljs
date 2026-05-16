(defn shell-sort [coll]
  (let [arr (js/Int32Array. (clj->js coll))
        n (.-length arr)]
    (loop [gap (quot n 2)]
      (when (> gap 0)
        (dotimes [_ (- n gap)]
          (let [i (+ _ gap)
                temp (aget arr i)]
            (loop [j i]
              (if (and (>= j gap) (> (aget arr (- j gap)) temp))
                (do
                  (aset arr j (aget arr (- j gap)))
                  (recur (- j gap)))
                (aset arr j temp)))))
        (recur (quot gap 2))))
    (js->clj arr)))

(println (shell-sort [64 34 25 12 22 11 90]))
