(define (insert node val)
  (if (null? node)
    (list val '() '())
    (if (< val (car node))
      (list (car node) (insert (cadr node) val) (caddr node))
      (if (> val (car node))
        (list (car node) (cadr node) (insert (caddr node) val))
        node))))

(define (inorder node)
  (if (null? node)
    '()
    (append (inorder (cadr node))
            (cons (car node) (inorder (caddr node))))))

(define (tree-sort arr)
  (inorder (foldl insert '() arr)))

(display (tree-sort '(5 2 8 1 9 3)))
