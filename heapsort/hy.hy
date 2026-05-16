(defn heapify [arr n i]
  (setv largest i
        left (+ (* 2 i) 1)
        right (+ (* 2 i) 2))
  (when (and (< left n) (> (get arr left) (get arr largest)))
    (setv largest left))
  (when (and (< right n) (> (get arr right) (get arr largest)))
    (setv largest right))
  (when (!= largest i)
    (setv tmp (get arr i))
    (setv (get arr i) (get arr largest))
    (setv (get arr largest) tmp)
    (heapify arr n largest)))

(defn heapsort [arr]
  (setv n (len arr))
  (for [i (range (- (// n 2) 1) -1 -1)]
    (heapify arr n i))
  (for [i (range (- n 1) 0 -1)]
    (setv tmp (get arr 0))
    (setv (get arr 0) (get arr i))
    (setv (get arr i) tmp)
    (heapify arr i 0))
  arr)

(setv arr [12 11 13 5 6 7])
(print (heapsort arr))
