(defn shell-sort [arr]
  (def n (length arr))
  (var gap (math/floor (/ n 2)))
  (while (> gap 0)
    (for i gap n
      (def temp (arr i))
      (var j i)
      (while (and (>= j gap) (> (arr (- j gap)) temp))
        (put arr j (arr (- j gap)))
        (set j (- j gap)))
      (put arr j temp))
    (set gap (math/floor (/ gap 2))))
  arr)

(def arr @[64 34 25 12 22 11 90])
(print (shell-sort arr))
