(defn stooge-sort! [arr first last]
    (when (> (get arr first) (get arr last))
        (let [tmp (get arr first)]
            (aset arr first (get arr last))
            (aset arr last tmp)))
    (when (> (- last first -1) 2)
        (let [t (quot (* (- last first -1) 2) 3)]
            (stooge-sort! arr first (+ first t -1))
            (stooge-sort! arr (- last t -1) last)
            (stooge-sort! arr first (+ first t -1)))))

(let [arr (int-array [3 1 4 1 5 9 2 6])]
    (stooge-sort! arr 0 (dec (count arr)))
    (println (vec arr)))
