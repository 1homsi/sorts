(define gnome-sort
  (lambda (lst)
    (run* (q)
      (gnome-sorto lst q))))

(define gnome-sorto
  (lambda (lst sorted)
    (conde
      [(== lst '()) (== sorted '())]
      [(fresh (h t s)
         (== lst (cons h t))
         (gnome-sorto t s)
         (insert-gnomeo h s sorted))])))

(define insert-gnomeo
  (lambda (x lst out)
    (conde
      [(== lst '()) (== out (list x))]
      [(fresh (h t)
         (== lst (cons h t))
         (conde
           [(<o x h) (== out (cons x lst))]
           [(>= x h)
            (fresh (rest)
              (insert-gnomeo x t rest)
              (== out (cons h rest)))]) )])))
