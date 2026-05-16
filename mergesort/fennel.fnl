(fn merge [left right]
  (if (= (length left) 0) right
      (= (length right) 0) left
      (let [lh (. left 1)
            rh (. right 1)
            lt (icollect [i v (ipairs left) :when (> i 1)] v)
            rt (icollect [i v (ipairs right) :when (> i 1)] v)]
        (if (<= lh rh)
            (doto [lh] (table.move (merge lt right) 1 (length (merge lt right)) 2))
            (doto [rh] (table.move (merge left rt) 1 (length (merge left rt)) 2))))))

(fn merge-sort [arr]
  (let [n (length arr)]
    (if (<= n 1) arr
        (let [mid (math.floor (/ n 2))
              left (icollect [i v (ipairs arr) :when (<= i mid)] v)
              right (icollect [i v (ipairs arr) :when (> i mid)] v)]
          (merge (merge-sort left) (merge-sort right))))))

(print (table.concat (merge-sort [38 27 43 3 9 82 10]) " "))
