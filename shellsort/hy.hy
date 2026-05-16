(defn shell-sort [arr]
  (setv n (len arr))
  (setv gap (// n 2))
  (while (> gap 0)
    (for [i (range gap n)]
      (setv temp (get arr i))
      (setv j i)
      (while (and (>= j gap) (> (get arr (- j gap)) temp))
        (setv (get arr j) (get arr (- j gap)))
        (setv j (- j gap)))
      (setv (get arr j) temp))
    (setv gap (// gap 2)))
  arr)

(setv arr [64 34 25 12 22 11 90])
(print (shell-sort arr))
