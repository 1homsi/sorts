(defn insert [tree v]
  (if (nil? tree)
      {:val v :left nil :right nil}
      (if (< v (tree :val))
          (put (table ;(pairs tree)) :left (insert (tree :left) v))
          (put (table ;(pairs tree)) :right (insert (tree :right) v)))))

(defn inorder [tree result]
  (when (not (nil? tree))
    (inorder (tree :left) result)
    (array/push result (tree :val))
    (inorder (tree :right) result)))

(defn treesort [arr]
  (var root nil)
  (each v arr
    (set root (insert root v)))
  (def result @[])
  (inorder root result)
  result)

(pp (treesort [5 3 7 1 4 6 8]))
