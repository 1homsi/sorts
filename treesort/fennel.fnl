(fn insert [tree v]
  (if (= tree nil)
      {:val v :left nil :right nil}
      (if (< v tree.val)
          (do (set tree.left (insert tree.left v)) tree)
          (do (set tree.right (insert tree.right v)) tree))))

(fn inorder [tree result]
  (when (not= tree nil)
    (inorder tree.left result)
    (table.insert result tree.val)
    (inorder tree.right result)))

(fn treesort [arr]
  (var root nil)
  (each [_ v (ipairs arr)]
    (set root (insert root v)))
  (local result {})
  (inorder root result)
  result)

(print (table.concat (treesort [5 3 7 1 4 6 8]) " "))
