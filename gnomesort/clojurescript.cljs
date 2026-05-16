(defn gnome-sort [coll]
  (let [arr (js/Array.from (clj->js coll))
        n (.-length arr)]
    (loop [i 0]
      (when (< i n)
        (if (or (= i 0) (>= (aget arr i) (aget arr (dec i))))
          (recur (inc i))
          (do
            (let [tmp (aget arr i)]
              (aset arr i (aget arr (dec i)))
              (aset arr (dec i) tmp))
            (recur (dec i))))))
    (js->clj arr)))
