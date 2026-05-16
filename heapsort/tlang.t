(def heapsort [arr]
  (let [n (length arr)]
    (dotimes [i (quot n 2)]
      (siftdown arr (- (quot n 2) i 1) n))
    (dotimes [i (- n 1)]
      (let [temp (aget arr 0)]
        (aset arr 0 (aget arr (- n i 1)))
        (aset arr (- n i 1) temp)
        (siftdown arr 0 (- n i 1)))))
  arr)

(def siftdown [arr idx n]
  (let [largest idx
        left (+ (* 2 idx) 1)
        right (+ (* 2 idx) 2)]
    (when (and (< left n) (> (aget arr left) (aget arr largest)))
      (set! largest left))
    (when (and (< right n) (> (aget arr right) (aget arr largest)))
      (set! largest right))
    (when (not= largest idx)
      (let [temp (aget arr idx)]
        (aset arr idx (aget arr largest))
        (aset arr largest temp))
      (siftdown arr largest n))))

(println (heapsort [5 2 8 1 9 3]))
