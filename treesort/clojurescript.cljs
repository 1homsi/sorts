(defn insert [tree v]
  (if (nil? tree)
      {:val v :left nil :right nil}
      (if (< v (:val tree))
          (assoc tree :left (insert (:left tree) v))
          (assoc tree :right (insert (:right tree) v)))))

(defn inorder [tree]
  (if (nil? tree)
      []
      (concat (inorder (:left tree)) [(:val tree)] (inorder (:right tree)))))

(defn treesort [arr]
  (let [tree (reduce insert nil arr)]
    (inorder tree)))

(println (treesort [5 3 7 1 4 6 8]))
