(defn insert-sorted [x lst]
  (cond
    (empty? lst) [x]
    (<= x (first lst)) (array/concat @[x] lst)
    (array/concat @[(first lst)] (insert-sorted x (slice lst 1)))))

(defn insertion-sort [lst]
  (if (empty? lst)
    @[]
    (insert-sorted (first lst) (insertion-sort (slice lst 1)))))

(defn get-idx [num mn mx n]
  (min (- n 1)
       (math/floor (* (/ (- num mn) (+ (- mx mn) 1)) n))))

(defn bucket-sort [arr]
  (let [n (length arr)]
    (if (= n 0) arr
      (let [mn (min ;arr)
            mx (max ;arr)
            buckets (array/new-filled n @[])]
        (each num arr
          (let [idx (get-idx num mn mx n)]
            (put buckets idx (array/push (buckets idx) num))))
        (let [result @[]]
          (each b buckets
            (each v (insertion-sort b)
              (array/push result v)))
          result)))))

(print (bucket-sort @[0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68]))
