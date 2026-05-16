(defn flip [arr k]
  (var left 0)
  (var right k)
  (while (< left right)
    (def tmp (get arr left))
    (put arr left (get arr right))
    (put arr right tmp)
    (++ left)
    (-- right)))

(defn find-max-idx [arr size]
  (var max-idx 0)
  (for i 1 size
    (when (> (get arr i) (get arr max-idx))
      (set max-idx i)))
  max-idx)

(defn pancake-sort [arr]
  (var size (length arr))
  (while (> size 1)
    (def mi (find-max-idx arr size))
    (when (not= mi (- size 1))
      (when (not= mi 0) (flip arr mi))
      (flip arr (- size 1)))
    (-- size))
  arr)

(pp (pancake-sort @[3 6 2 7 4 1 5]))
