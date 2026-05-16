(fn is-sorted [arr]
  (var sorted true)
  (for [i 1 (- (length arr) 1)]
    (when (> (. arr i) (. arr (+ i 1)))
      (set sorted false)))
  sorted)

(fn shuffle [arr]
  (let [n (length arr)]
    (for [i n 2 -1]
      (let [j (math.random i)
            tmp (. arr i)]
        (tset arr i (. arr j))
        (tset arr j tmp))))
  arr)

(fn bogosort [arr]
  (while (not (is-sorted arr))
    (shuffle arr))
  arr)

(math.randomseed (os.time))
(let [arr [3 1 4 1 5 9 2 6]]
  (print (table.concat (bogosort arr) " ")))
