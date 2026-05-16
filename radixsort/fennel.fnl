(fn get-digit [x exp]
  (% (math.floor (/ x exp)) 10))

(fn counting-sort [arr exp]
  (let [result []]
    (for [d 0 9]
      (each [_ x (ipairs arr)]
        (when (= (get-digit x exp) d)
          (table.insert result x))))
    result))

(fn radix-sort [arr]
  (if (= (length arr) 0)
    arr
    (let [max-val (math.max (table.unpack arr))]
      (var exp 1)
      (var result arr)
      (while (> (math.floor (/ max-val exp)) 0)
        (set result (counting-sort result exp))
        (set exp (* exp 10)))
      result)))

(local arr [170 45 75 90 802 24 2 66])
(print (table.concat (radix-sort arr) " "))
