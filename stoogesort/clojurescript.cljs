(defn stooge-sort! [arr first last]
    (when (> (aget arr first) (aget arr last))
        (let [tmp (aget arr first)]
            (aset arr first (aget arr last))
            (aset arr last tmp)))
    (let [n (- last first -1)]
        (when (> n 2)
            (let [t (quot (* n 2) 3)]
                (stooge-sort! arr first (+ first t -1))
                (stooge-sort! arr (- last t -1) last)
                (stooge-sort! arr first (+ first t -1))))))

(def arr (array 3 1 4 1 5 9 2 6))
(stooge-sort! arr 0 (dec (alength arr)))
(js/console.log arr)
