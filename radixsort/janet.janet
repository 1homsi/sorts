(defn get-digit [x exp]
  (% (math/floor (/ x exp)) 10))

(defn counting-sort [arr exp]
  (def result @[])
  (for d 0 10
    (each x arr
      (when (= (get-digit x exp) d)
        (array/push result x))))
  result)

(defn radix-sort [arr]
  (if (empty? arr)
    arr
    (let [max-val (max ;arr)]
      (var exp 1)
      (var result arr)
      (while (> (math/floor (/ max-val exp)) 0)
        (set result (counting-sort result exp))
        (set exp (* exp 10)))
      result)))

(pp (radix-sort @[170 45 75 90 802 24 2 66]))
