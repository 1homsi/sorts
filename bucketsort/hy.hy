(defn insert-sorted [x lst]
  (cond
    [(not lst) [x]]
    [(<= x (first lst)) (+ [x] lst)]
    [True (+ [(first lst)] (insert-sorted x (rest lst)))]))

(defn insertion-sort [lst]
  (if (not lst)
    []
    (insert-sorted (first lst) (insertion-sort (rest lst)))))

(defn get-idx [num mn mx n]
  (min (- n 1)
       (int (// (* (/ (- num mn) (+ (- mx mn) 1)) n) 1))))

(defn bucket-sort [arr]
  (let [n (len arr)]
    (if (= n 0)
      arr
      (let [mn (min arr)
            mx (max arr)
            buckets (list (repeat [] n))]
        (for [num arr]
          (let [idx (get-idx num mn mx n)]
            (.append (get buckets idx) num)))
        (sum (lfor b buckets (insertion-sort b)) [])))))

(print (bucket-sort [0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68]))
