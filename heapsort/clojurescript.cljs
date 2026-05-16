(defn heapify [arr n i]
  (let [left (+ (* 2 i) 1)
        right (+ (* 2 i) 2)
        largest0 (if (and (< left n) (> (aget arr left) (aget arr i))) left i)
        largest (if (and (< right n) (> (aget arr right) (aget arr largest0))) right largest0)]
    (when (not= largest i)
      (let [tmp (aget arr i)]
        (aset arr i (aget arr largest))
        (aset arr largest tmp))
      (heapify arr n largest))))

(defn heapsort [arr]
  (let [n (.-length arr)]
    (doseq [i (range (dec (quot n 2)) -1 -1)] (heapify arr n i))
    (doseq [i (range (dec n) 0 -1)]
      (let [tmp (aget arr 0)]
        (aset arr 0 (aget arr i))
        (aset arr i tmp))
      (heapify arr i 0)))
  arr)

(def arr (array 12 11 13 5 6 7))
(js/console.log (heapsort arr))
