(defn flip [arr k]
  (vec (concat (reverse (take (inc k) arr)) (drop (inc k) arr))))

(defn find-max-idx [arr size]
  (let [sub (take size arr)]
    (.indexOf (vec sub) (apply max sub))))

(defn pancake-sort [arr]
  (loop [a (vec arr) size (count arr)]
    (if (<= size 1)
      a
      (let [max-idx (find-max-idx a size)
            a1 (if (not= max-idx 0) (flip a max-idx) a)
            a2 (flip a1 (dec size))]
        (recur a2 (dec size))))))

(println (pancake-sort [3 6 2 7 4 1 5]))
