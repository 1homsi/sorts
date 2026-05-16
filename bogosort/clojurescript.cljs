(defn is-sorted? [coll]
  (every? (fn [[a b]] (<= a b)) (partition 2 1 coll)))

(defn shuffle-arr [coll]
  (let [arr (js/Array.from (clj->js coll))
        n (.-length arr)]
    (doseq [i (range (dec n) 0 -1)]
      (let [j (js/Math.floor (* (js/Math.random) (inc i)))
            tmp (aget arr i)]
        (aset arr i (aget arr j))
        (aset arr j tmp)))
    (js->clj arr)))

(defn bogosort [coll]
  (loop [arr coll]
    (if (is-sorted? arr)
      arr
      (recur (shuffle-arr arr)))))

(println (bogosort [3 1 4 1 5 9 2 6]))
