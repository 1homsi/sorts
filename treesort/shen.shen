(define insert
    Tree 0 V -> [V [] []]
    [X L R] V -> [(X) (insert L V) R] where (< V X)
    [X L R] V -> [X L (insert R V)])

(define inorder
    [] -> []
    [V L R] -> (append (inorder L) [V] (inorder R)))

(define treesort
    Arr -> (inorder (fold-left (function insert) [] Arr)))

(output "~S~%" (treesort [5 3 7 1 4 6 8]))
