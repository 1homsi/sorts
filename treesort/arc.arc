(def insert (tree v)
  (if (no tree)
      (list v nil nil)
      (if (< v (car tree))
          (list (car tree) (insert (cadr tree) v) (caddr tree))
          (list (car tree) (cadr tree) (insert (caddr tree) v)))))

(def inorder (tree)
  (if (no tree)
      nil
      (join (inorder (cadr tree)) (list (car tree)) (inorder (caddr tree)))))

(def treesort (arr)
  (inorder (reduce insert nil arr)))

(prn (treesort '(5 3 7 1 4 6 8)))
