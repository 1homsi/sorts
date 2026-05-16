(defun bst-insert (tree v)
  (if (null tree)
      (list v nil nil)
    (if (< v (car tree))
        (list (car tree) (bst-insert (cadr tree) v) (caddr tree))
      (list (car tree) (cadr tree) (bst-insert (caddr tree) v)))))

(defun bst-inorder (tree)
  (if (null tree)
      nil
    (append (bst-inorder (cadr tree)) (list (car tree)) (bst-inorder (caddr tree)))))

(defun treesort (arr)
  (let ((tree (seq-reduce #'bst-insert arr nil)))
    (bst-inorder tree)))

(message "%S" (treesort '(5 3 7 1 4 6 8)))
