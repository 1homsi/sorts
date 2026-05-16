(define count-smaller
  [] _ -> 0
  [X|Xs] Item -> (if (< X Item)
                    (+ 1 (count-smaller Xs Item))
                    (count-smaller Xs Item)))

(define cycle-sort-list
  [] -> []
  [X|Xs] -> (let Smaller (count-smaller Xs X)
                 Pos Smaller
                 (insert-at X Pos (cycle-sort-list Xs))))

(define insert-at
  X 0 Xs -> [X|Xs]
  X N [Y|Ys] -> [Y|(insert-at X (- N 1) Ys)])

(define cycle-sort
  Xs -> (cycle-sort-list Xs))

(output "~A~%" (cycle-sort [5 4 3 2 1]))
