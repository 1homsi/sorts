(defn quicksort [arr]
  (if (<= (length arr) 1)
    arr
    (let [pivot (arr (math/floor (/ (length arr) 2)))
          left (filter |(< $ pivot) arr)
          middle (filter |(= $ pivot) arr)
          right (filter |(> $ pivot) arr)]
      (array/concat (quicksort left) middle (quicksort right)))))

(print (quicksort @[3 6 8 10 1 2 1]))
