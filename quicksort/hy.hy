(defn quicksort [lst]
  (if (<= (len lst) 1)
    lst
    (let [pivot (get lst (// (len lst) 2))
          left (list (filter (fn [x] (< x pivot)) lst))
          middle (list (filter (fn [x] (= x pivot)) lst))
          right (list (filter (fn [x] (> x pivot)) lst))]
      (+ (quicksort left) middle (quicksort right)))))

(print (quicksort [3 6 8 10 1 2 1]))
