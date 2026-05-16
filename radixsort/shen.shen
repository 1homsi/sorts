(define get-digit
    X Exp -> (mod (div X Exp) 10))

(define counting-sort
    Xs Exp ->
    (let Digits (map (lambda D
                       (filter (lambda X (= (get-digit X Exp) D)) Xs))
                     (range 0 9))
         (apply append Digits)))

(define radix-sort
    [] -> []
    Xs ->
    (let MaxVal (fold-left (lambda A X (if (> X A) X A)) 0 Xs)
         Loop (lambda Arr Exp
                (if (= (div MaxVal Exp) 0) Arr
                    (Loop (counting-sort Arr Exp) (* Exp 10))))
         (Loop Xs 1)))

(output "~A~%" (radix-sort [170 45 75 90 802 24 2 66]))
