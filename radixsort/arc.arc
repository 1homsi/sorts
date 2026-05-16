(def get-digit (x exp)
  (mod (int (/ x exp)) 10))

(def counting-sort (arr exp)
  (apply join
    (map (fn (d)
           (keep (fn (x) (is (get-digit x exp) d)) arr))
         (range 0 9))))

(def radix-sort (arr)
  (if (no arr) arr
      (let max-val (apply max arr)
        (loop (arr arr exp 1)
          (if (> (int (/ max-val exp)) 0)
              (loop (counting-sort arr exp) (* exp 10))
              arr)))))

(prn (radix-sort '(170 45 75 90 802 24 2 66)))
