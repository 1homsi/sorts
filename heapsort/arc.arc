(def heapify (arr n i)
  (let largest i
    (let left (+ (* 2 i) 1)
      (let right (+ (* 2 i) 2)
        (when (and (< left n) (> (arr left) (arr largest)))
          (= largest left))
        (when (and (< right n) (> (arr right) (arr largest)))
          (= largest right))
        (when (~= largest i)
          (let tmp (arr i)
            (= (arr i) (arr largest))
            (= (arr largest) tmp))
          (heapify arr n largest))))))

(def heapsort (arr)
  (let n (len arr)
    (for i (- (/ n 2) 1) 0
      (heapify arr n i))
    (for i (- n 1) 1
      (let tmp (arr 0)
        (= (arr 0) (arr i))
        (= (arr i) tmp))
      (heapify arr i 0))
    arr))

(let arr (list->table '(12 11 13 5 6 7))
  (heapsort arr)
  (prn arr))
