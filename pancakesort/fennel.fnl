(fn flip [arr k]
  (var left 0)
  (var right k)
  (while (< left right)
    (let [tmp (. arr (+ left 1))]
      (tset arr (+ left 1) (. arr (+ right 1)))
      (tset arr (+ right 1) tmp))
    (set left (+ left 1))
    (set right (- right 1))))

(fn find-max-idx [arr size]
  (var max-idx 0)
  (for [i 1 (- size 1)]
    (when (> (. arr (+ i 1)) (. arr (+ max-idx 1)))
      (set max-idx i)))
  max-idx)

(fn pancake-sort [arr]
  (var size (length arr))
  (while (> size 1)
    (let [mi (find-max-idx arr size)]
      (when (~= mi (- size 1))
        (when (~= mi 0) (flip arr mi))
        (flip arr (- size 1))))
    (set size (- size 1)))
  arr)

(print (table.concat (pancake-sort [3 6 2 7 4 1 5]) " "))
