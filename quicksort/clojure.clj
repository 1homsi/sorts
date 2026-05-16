(defn quicksort [coll]
  (if (empty? coll)
    coll
    (let [pivot (first coll)
          rest (rest coll)
          left (filter #(<= % pivot) rest)
          right (filter #(> % pivot) rest)]
      (concat (quicksort left) [pivot] (quicksort right)))))

(println (quicksort [3 6 8 10 1 2 1]))
