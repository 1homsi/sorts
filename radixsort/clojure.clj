(defn counting-sort [arr exp]
  (let [buckets (reduce (fn [bs x]
                          (let [idx (mod (quot x exp) 10)]
                            (update bs idx conj x)))
                        (vec (repeat 10 []))
                        arr)]
    (apply concat (map reverse buckets))))

(defn radix-sort [arr]
  (if (empty? arr)
    arr
    (let [max-val (apply max arr)
          exps (take-while #(> (quot max-val %) 0) (iterate #(* % 10) 1))]
      (reduce counting-sort arr exps))))

(println (radix-sort [170 45 75 90 802 24 2 66]))
