(define (selection-sort-o lst out)
  (conde
    [(== lst '()) (== out '())]
    [(fresh (min rest sorted)
       (min-o lst min)
       (remove-first-o min lst rest)
       (selection-sort-o rest sorted)
       (== out (cons min sorted)))]))

(define (min-o lst m)
  (conde
    [(fresh (h) (== lst (list h)) (== m h))]
    [(fresh (h t mt)
       (== lst (cons h t))
       (min-o t mt)
       (conde
         [(< h mt) (== m h)]
         [(>= h mt) (== m mt)]))]))
