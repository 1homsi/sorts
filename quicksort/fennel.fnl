(fn quicksort [lst]
  (if (<= (length lst) 1)
      lst
      (let [pivot (. lst (math.floor (/ (length lst) 2)))
            left (icollect [_ v (ipairs lst)] (if (< v pivot) v))
            middle (icollect [_ v (ipairs lst)] (if (= v pivot) v))
            right (icollect [_ v (ipairs lst)] (if (> v pivot) v))]
        (let [result []]
          (each [_ v (ipairs (quicksort left))] (table.insert result v))
          (each [_ v (ipairs middle)] (table.insert result v))
          (each [_ v (ipairs (quicksort right))] (table.insert result v))
          result))))

(print (table.concat (quicksort [3 6 8 10 1 2 1]) " "))
