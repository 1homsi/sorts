(def counting-sort (arr)
  (if (no arr) arr
    (let (mn (apply min arr)
          mx (apply max arr)
          range (+ (- mx mn) 1))
      (let count (n-of range 0)
        (each v arr
          (= (nth count (- v mn)) (+ (nth count (- v mn)) 1)))
        (for i 1 (- range 1)
          (= (nth count i) (+ (nth count i) (nth count (- i 1)))))
        (let output (n-of (len arr) 0)
          (forlen i arr
            (let v (nth arr (- (len arr) 1 i))
              (= (nth count (- v mn)) (- (nth count (- v mn)) 1))
              (= (nth output (nth count (- v mn))) v)))
          output)))))

(prn (counting-sort '(4 2 2 8 3 3 1)))
