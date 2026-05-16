(fn shell-sort [arr]
  (let [n (length arr)]
    (var gap (math.floor (/ n 2)))
    (while (> gap 0)
      (for [i (+ gap 1) n]
        (let [temp (. arr i)]
          (var j i)
          (while (and (>= j (+ gap 1)) (> (. arr (- j gap)) temp))
            (tset arr j (. arr (- j gap)))
            (set j (- j gap)))
          (tset arr j temp)))
      (set gap (math.floor (/ gap 2))))
    arr))

(let [arr [64 34 25 12 22 11 90]]
  (print (table.concat (shell-sort arr) " ")))
