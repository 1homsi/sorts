(defn cocktail-sort [arr]
  (var swapped true)
  (var start 0)
  (var ending (- (length arr) 1))
  (while swapped
    (set swapped false)
    (loop [i :range [start ending]]
      (when (> (arr i) (arr (+ i 1)))
        (let [tmp (arr i)]
          (put arr i (arr (+ i 1)))
          (put arr (+ i 1) tmp)
          (set swapped true))))
    (when (not swapped) (break))
    (set swapped false)
    (-- ending)
    (var i (- ending 1))
    (while (>= i start)
      (when (> (arr i) (arr (+ i 1)))
        (let [tmp (arr i)]
          (put arr i (arr (+ i 1)))
          (put arr (+ i 1) tmp)
          (set swapped true)))
      (-- i))
    (++ start))
  arr)
