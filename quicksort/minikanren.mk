(define (quicksorto lst sorted)
  (conde
    ((== lst '()) (== sorted '()))
    ((fresh (pivot rest left right sl sr)
       (conso pivot rest lst)
       (partitiono pivot rest left right)
       (quicksorto left sl)
       (quicksorto right sr)
       (appendo sl (cons pivot sr) sorted)))))

(define (partitiono pivot lst less greater)
  (conde
    ((== lst '()) (== less '()) (== greater '()))
    ((fresh (h t rl rg)
       (conso h t lst)
       (conde
         ((<=o h pivot)
          (partitiono pivot t rl rg)
          (conso h rl less)
          (== greater rg))
         ((>o h pivot)
          (partitiono pivot t rl rg)
          (== less rl)
          (conso h rg greater)))))))

(run* (q) (quicksorto '(3 6 8 10 1 2 1) q))
