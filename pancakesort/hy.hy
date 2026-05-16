(defn flip [arr k]
  (setv left 0 right k)
  (while (< left right)
    (setv tmp (get arr left))
    (setv (get arr left) (get arr right))
    (setv (get arr right) tmp)
    (+= left 1)
    (-= right 1)))

(defn find-max-idx [arr size]
  (setv max-idx 0)
  (for [i (range 1 size)]
    (when (> (get arr i) (get arr max-idx))
      (setv max-idx i)))
  max-idx)

(defn pancake-sort [arr]
  (setv size (len arr))
  (while (> size 1)
    (setv mi (find-max-idx arr size))
    (when (!= mi (- size 1))
      (when (!= mi 0) (flip arr mi))
      (flip arr (- size 1)))
    (-= size 1))
  arr)

(print (pancake-sort [3 6 2 7 4 1 5]))
