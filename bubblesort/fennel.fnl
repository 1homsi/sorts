(fn bubble-sort [arr]
  (var n (length arr))
  (var swapped true)
  (while swapped
    (set swapped false)
    (for i 1 (- n 1)
      (when (> (. arr i) (. arr (+ i 1)))
        (let [tmp (. arr i)]
          (tset arr i (. arr (+ i 1)))
          (tset arr (+ i 1) tmp)
          (set swapped true))))
    (set n (- n 1)))
  arr)

(local arr [64 34 25 12 22 11 90])
(print (table.concat (bubble-sort arr) " "))
