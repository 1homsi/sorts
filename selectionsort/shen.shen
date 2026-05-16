(define selection-sort
  [] -> []
  Xs -> (let Min (minimum Xs)
             Rest (remove Min Xs)
         (cons Min (selection-sort Rest))))

(define minimum
  [X] -> X
  [X | Xs] -> (let M (minimum Xs)
               (if (< X M) X M)))

(define remove
  _ [] -> []
  X [X | Xs] -> Xs
  X [Y | Ys] -> [Y | (remove X Ys)])
