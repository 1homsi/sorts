(defn heapify [arr n i]
  (let [left (+ (* 2 i) 1)
        right (+ (* 2 i) 2)
        largest0 (if (and (< left n) (> (arr left) (arr i))) left i)
        largest (if (and (< right n) (> (arr right) (arr largest0))) right largest0)]
    (if (not= largest i)
      (let [arr' (assoc arr i (arr largest) largest (arr i))]
        (heapify arr' n largest))
      arr)))

(defn heapsort [coll]
  (let [n (count coll)
        arr (vec coll)
        heap (reduce (fn [a i] (heapify a n i)) arr (range (dec (quot n 2)) -1 -1))
        sorted (reduce (fn [a i]
                         (let [a' (assoc a 0 (a i) i (a 0))]
                           (heapify a' i 0)))
                       heap (range (dec n) 0 -1))]
    sorted))

(println (heapsort [12 11 13 5 6 7]))
