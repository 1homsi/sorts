(define (insert node val)
  (cond ((null? node) (list val '() '()))
        ((< val (car node)) (list (car node) (insert (cadr node) val) (caddr node)))
        ((> val (car node)) (list (car node) (cadr node) (insert (caddr node) val)))
        (else node)))

(define (inorder node)
  (cond ((null? node) '())
        (else (append (inorder (cadr node))
                      (cons (car node) (inorder (caddr node)))))))

(define (tree-sort arr)
  (inorder (foldl insert '() arr)))

(display (tree-sort '(5 2 8 1 9 3)))
