(defn insert [tree v]
  (if (is tree None)
      {"val" v "left" None "right" None}
      (if (< v (get tree "val"))
          (do (assoc tree "left" (insert (get tree "left") v)) tree)
          (do (assoc tree "right" (insert (get tree "right") v)) tree))))

(defn inorder [tree result]
  (when (is-not tree None)
    (inorder (get tree "left") result)
    (.append result (get tree "val"))
    (inorder (get tree "right") result)))

(defn treesort [arr]
  (setv root None)
  (for [v arr]
    (setv root (insert root v)))
  (setv result [])
  (inorder root result)
  result)

(print (treesort [5 3 7 1 4 6 8]))
