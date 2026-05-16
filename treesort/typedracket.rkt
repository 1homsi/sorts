#lang typed/racket

(define-type Tree (U '() (List Integer Tree Tree)))

(: tree-insert (-> Tree Integer Tree))
(define (tree-insert tree v)
  (cond
    [(null? tree) (list v '() '())]
    [(< v (car tree)) (list (car tree) (tree-insert (cadr tree) v) (caddr tree))]
    [else (list (car tree) (cadr tree) (tree-insert (caddr tree) v))]))

(: tree-inorder (-> Tree (Listof Integer)))
(define (tree-inorder tree)
  (if (null? tree)
      '()
      (append (tree-inorder (cadr tree)) (list (car tree)) (tree-inorder (caddr tree)))))

(: treesort (-> (Listof Integer) (Listof Integer)))
(define (treesort arr)
  (tree-inorder (foldl (lambda ([v : Integer] [t : Tree]) (tree-insert t v)) '() arr)))

(displayln (treesort '(5 3 7 1 4 6 8)))
