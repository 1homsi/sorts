(def min-run 32)

(defn insert-val [x lst]
  (if (empty? lst)
    @[x]
    (let [h (first lst) t (array/slice lst 1)]
      (if (<= x h)
        (array x h ;t)
        (array h ;(insert-val x t))))))

(defn insertion-sort [lst]
  (reduce (fn [sorted x] (insert-val x sorted)) @[] lst))

(defn merge-runs [xs ys]
  (var i 0) (var j 0)
  (def result @[])
  (while (and (< i (length xs)) (< j (length ys)))
    (if (<= (xs i) (ys j))
      (do (array/push result (xs i)) (++ i))
      (do (array/push result (ys j)) (++ j))))
  (while (< i (length xs)) (array/push result (xs i)) (++ i))
  (while (< j (length ys)) (array/push result (ys j)) (++ j))
  result)

(defn chunks-of [n lst]
  (if (empty? lst) @[]
    (let [end (min n (length lst))]
      (array (array/slice lst 0 end) ;(chunks-of n (array/slice lst end))))))

(defn merge-pairs [runs]
  (case (length runs)
    0 @[]
    1 runs
    (array (merge-runs (runs 0) (runs 1)) ;(merge-pairs (array/slice runs 2)))))

(defn merge-all [runs]
  (if (= 1 (length runs)) (runs 0)
    (merge-all (merge-pairs runs))))

(defn timsort [lst]
  (if (empty? lst) lst
    (merge-all (map insertion-sort (chunks-of min-run lst)))))

(pp (timsort @[5 2 8 1 9 3 7 4 6]))
