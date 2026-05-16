(defn shellsort [arr]
    (let [n (count arr)
          arr (vec arr)]
        (loop [arr arr gap (quot n 2)]
            (if (zero? gap)
                (vec arr)
                (loop [arr arr i gap]
                    (if (>= i n)
                        arr
                        (let [temp (arr i)]
                            (loop [arr arr j i]
                                (if (or (< j gap) (<= (arr (- j gap)) temp))
                                    (recur arr (+ j 1))
                                    (recur (assoc arr j (arr (- j gap))) (- j gap)))))))
                (recur arr (quot gap 2)))))))
