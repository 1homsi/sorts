(defn merge [left right]
  (cond
    [(not left) right]
    [(not right) left]
    [(<= (first left) (first right))
     (+ [(first left)] (merge (rest left) right))]
    [True
     (+ [(first right)] (merge left (rest right)))]))

(defn merge-sort [lst]
  (let [n (len lst)]
    (if (<= n 1)
        lst
        (let [mid (// n 2)
              left (merge-sort (cut lst None mid))
              right (merge-sort (cut lst mid None))]
          (merge left right)))))

(print (merge-sort [38 27 43 3 9 82 10]))
