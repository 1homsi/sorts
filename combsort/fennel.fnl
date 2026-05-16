(fn comb-sort [arr]
  (let [n (length arr)]
    (var gap n)
    (var sorted false)
    (while (not sorted)
      (set gap (math.max 1 (math.floor (/ gap 1.3))))
      (when (= gap 1) (set sorted true))
      (for [i 1 (- n gap)]
        (when (> (. arr i) (. arr (+ i gap)))
          (let [tmp (. arr i)]
            (tset arr i (. arr (+ i gap)))
            (tset arr (+ i gap) tmp)
            (set sorted false)))))
    arr))
