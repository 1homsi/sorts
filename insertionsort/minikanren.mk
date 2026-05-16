(define (inserto x lst out)
  (conde
    ((== lst '()) (== out `(,x)))
    ((fresh (h t rest)
       (== lst `(,h . ,t))
       (conde
         ((<=o x h) (== out `(,x ,h . ,t)))
         ((>o x h)
          (inserto x t rest)
          (== out `(,h . ,rest))))))))

(define (insertion-sorto lst out)
  (conde
    ((== lst '()) (== out '()))
    ((fresh (h t sorted)
       (== lst `(,h . ,t))
       (insertion-sorto t sorted)
       (inserto h sorted out)))))
