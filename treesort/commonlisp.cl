(defstruct node val left right)

(defun insert (tree v)
  (if (null tree)
      (make-node :val v :left nil :right nil)
      (if (< v (node-val tree))
          (progn (setf (node-left tree) (insert (node-left tree) v)) tree)
          (progn (setf (node-right tree) (insert (node-right tree) v)) tree))))

(defun inorder (tree)
  (if (null tree)
      nil
      (append (inorder (node-left tree)) (list (node-val tree)) (inorder (node-right tree)))))

(defun treesort (arr)
  (let ((root nil))
    (dolist (v arr)
      (setq root (insert root v)))
    (inorder root)))

(print (treesort '(5 3 7 1 4 6 8)))
