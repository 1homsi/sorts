(defun insert (tree v)
  (if (null tree)
      (list v nil nil)
      (if (< v (car tree))
          (list (car tree) (insert (cadr tree) v) (caddr tree))
          (list (car tree) (cadr tree) (insert (caddr tree) v)))))

(defun inorder (tree)
  (if (null tree)
      nil
      (append (inorder (cadr tree)) (list (car tree)) (inorder (caddr tree)))))

(defun treesort (arr)
  (let ((tree nil))
    (dolist (v arr)
      (setq tree (insert tree v)))
    (inorder tree)))

(print (treesort '(5 3 7 1 4 6 8)))
