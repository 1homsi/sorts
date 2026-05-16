(fn stooge-sort [arr first last]
    (when (> (. arr (+ first 1)) (. arr (+ last 1)))
        (let [tmp (. arr (+ first 1))]
            (tset arr (+ first 1) (. arr (+ last 1)))
            (tset arr (+ last 1) tmp)))
    (let [n (- last first -1)]
        (when (> n 2)
            (let [t (math.floor (/ (* n 2) 3))]
                (stooge-sort arr first (+ first t -1))
                (stooge-sort arr (- last t -1) last)
                (stooge-sort arr first (+ first t -1))))))

(local arr [3 1 4 1 5 9 2 6])
(stooge-sort arr 0 (- (length arr) 1))
(print (table.concat arr " "))
