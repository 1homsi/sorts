(defn get-digit [x exp]
  (% (// x exp) 10))

(defn counting-sort [arr exp]
  (sum (lfor d (range 10)
             (lfor x arr :if (= (get-digit x exp) d) x))
       []))

(defn radix-sort [arr]
  (if (empty? arr)
    arr
    (do
      (setv max-val (max arr))
      (setv exp 1)
      (setv result arr)
      (while (> (// max-val exp) 0)
        (setv result (counting-sort result exp))
        (setv exp (* exp 10)))
      result)))

(print (radix-sort [170 45 75 90 802 24 2 66]))
