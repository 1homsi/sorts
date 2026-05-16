(ns pancake-sort.core)

(defn flip [arr k]
  (vec (concat (reverse (take (inc k) arr)) (drop (inc k) arr))))

(defn find-max-idx [arr size]
  (let [sub (take size arr)
        max-val (apply max sub)]
    (.indexOf (clj->js sub) max-val)))

(defn pancake-sort [arr]
  (loop [a (vec arr) size (count arr)]
    (if (<= size 1)
      a
      (let [mi (find-max-idx a size)
            a1 (if (not= mi 0) (flip a mi) a)
            a2 (flip a1 (dec size))]
        (recur a2 (dec size))))))

(js/console.log (clj->js (pancake-sort [3 6 2 7 4 1 5])))
