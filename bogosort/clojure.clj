(defn is-sorted? [coll]
  (every? (fn [[a b]] (<= a b)) (partition 2 1 coll)))

(defn bogosort [coll]
  (loop [arr coll]
    (if (is-sorted? arr)
      arr
      (recur (shuffle arr)))))

(println (bogosort [3 1 4 1 5 9 2 6]))
