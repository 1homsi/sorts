#lang racket

(define (insert tree v)
  (match tree
    ['() (list v '() '())]
    [(list x l r)
     (if (< v x)
         (list x (insert l v) r)
         (list x l (insert r v)))]))

(define (inorder tree)
  (match tree
    ['() '()]
    [(list v l r)
     (append (inorder l) (list v) (inorder r))]))

(define (treesort arr)
  (define tree (foldl (lambda (v t) (insert t v)) '() arr))
  (inorder tree))

(displayln (treesort '(5 3 7 1 4 6 8)))
