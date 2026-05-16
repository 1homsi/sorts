(fn cycle-sort [arr]
  (let [n (length arr)]
    (var writes 0)
    (for [cycle-start 1 (- n 1)]
      (var item (. arr cycle-start))
      (var pos cycle-start)
      (for [i (+ cycle-start 1) n]
        (when (< (. arr i) item)
          (set pos (+ pos 1))))
      (when (~= pos cycle-start)
        (while (= item (. arr pos))
          (set pos (+ pos 1)))
        (let [tmp (. arr pos)]
          (tset arr pos item)
          (set item tmp))
        (set writes (+ writes 1))
        (while (~= pos cycle-start)
          (set pos cycle-start)
          (for [i (+ cycle-start 1) n]
            (when (< (. arr i) item)
              (set pos (+ pos 1))))
          (while (= item (. arr pos))
            (set pos (+ pos 1)))
          (let [t (. arr pos)]
            (tset arr pos item)
            (set item t))
          (set writes (+ writes 1)))))
    writes))

(local arr [5 4 3 2 1])
(cycle-sort arr)
(print (table.concat arr " "))
