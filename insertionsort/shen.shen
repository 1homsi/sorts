(define insert
  X [] -> [X]
  X [H | T] -> [X H | T] where (<= X H)
  X [H | T] -> [H | (insert X T)])

(define insertion-sort
  [] -> []
  [H | T] -> (insert H (insertion-sort T)))
