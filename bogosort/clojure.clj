(defn is-sorted? [coll]
    (every? true? (map <= coll (rest coll))))

(defn bogosort [coll]
    (if (is-sorted? coll)
        coll
        (recur (shuffle coll))))
