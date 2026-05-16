(define insert-val
  X [] -> [X]
  X [H | T] -> [X H | T] where (<= X H)
  X [H | T] -> [H | (insert-val X T)])

(define insertion-sort
  [] -> []
  [H | T] -> (insert-val H (insertion-sort T)))

(define merge-runs
  [] Ys -> Ys
  Xs [] -> Xs
  [X | Xs] [Y | Ys] -> [X | (merge-runs Xs [Y | Ys])] where (<= X Y)
  [X | Xs] [Y | Ys] -> [Y | (merge-runs [X | Xs] Ys)])

(define take-n
  0 _ -> []
  _ [] -> []
  N [H | T] -> [H | (take-n (- N 1) T)])

(define drop-n
  0 Xs -> Xs
  _ [] -> []
  N [_ | T] -> (drop-n (- N 1) T))

(define chunks-of
  _ [] -> []
  N Xs -> [(take-n N Xs) | (chunks-of N (drop-n N Xs))])

(define merge-pairs
  [] -> []
  [X] -> [X]
  [X Y | Rest] -> [(merge-runs X Y) | (merge-pairs Rest)])

(define merge-all
  [X] -> X
  Xs -> (merge-all (merge-pairs Xs)))

(define timsort
  [] -> []
  Xs -> (merge-all (map (fn insertion-sort) (chunks-of 32 Xs))))

(output "~A~%" (timsort [5 2 8 1 9 3 7 4 6]))
