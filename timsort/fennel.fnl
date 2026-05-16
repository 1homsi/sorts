(local min-run 32)

(fn insert-val [x lst]
  (if (= (length lst) 0)
    [x]
    (let [h (. lst 1)
          t (icollect [i v (ipairs lst)] (when (> i 1) v))]
      (if (<= x h)
        (doto [x] (table.insert 2 h) (#(each [i v (ipairs t)] (table.insert $ (+ i 2) v))))
        (let [rest (insert-val x t)]
          (doto [h] (#(each [i v (ipairs rest)] (table.insert $ (+ i 1) v)))))))))

(fn insertion-sort [lst]
  (accumulate [sorted [] _ v (ipairs lst)]
    (insert-val v sorted)))

(fn merge-runs [xs ys]
  (var i 1) (var j 1)
  (local result [])
  (while (and (<= i (length xs)) (<= j (length ys)))
    (if (<= (. xs i) (. ys j))
      (do (table.insert result (. xs i)) (set i (+ i 1)))
      (do (table.insert result (. ys j)) (set j (+ j 1)))))
  (while (<= i (length xs)) (table.insert result (. xs i)) (set i (+ i 1)))
  (while (<= j (length ys)) (table.insert result (. ys j)) (set j (+ j 1)))
  result)

(fn chunks-of [n lst]
  (if (= (length lst) 0) []
    (let [chunk (icollect [i v (ipairs lst)] (when (<= i n) v))
          rest (icollect [i v (ipairs lst)] (when (> i n) v))]
      (doto [chunk] (#(each [i v (ipairs (chunks-of n rest))] (table.insert $ (+ i 1) v)))))))

(fn merge-pairs [runs]
  (if (= (length runs) 0) []
    (= (length runs) 1) runs
    (let [merged (merge-runs (. runs 1) (. runs 2))
          rest (merge-pairs (icollect [i v (ipairs runs)] (when (> i 2) v)))]
      (doto [merged] (#(each [i v (ipairs rest)] (table.insert $ (+ i 1) v)))))))

(fn merge-all [runs]
  (if (= (length runs) 1) (. runs 1)
    (merge-all (merge-pairs runs))))

(fn timsort [lst]
  (if (= (length lst) 0) lst
    (merge-all (icollect [_ c (ipairs (chunks-of min-run lst))] (insertion-sort c)))))

(print (table.concat (timsort [5 2 8 1 9 3 7 4 6]) " "))
