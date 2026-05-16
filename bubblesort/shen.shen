(define bubble-pass
  [] -> [[] false]
  [X] -> [[X] false]
  [X Y | Rest] ->
    (if (> X Y)
      (let Sorted (bubble-pass [X | Rest])
        [(cons Y (head Sorted)) true])
      (let Sorted (bubble-pass [Y | Rest])
        [(cons X (head Sorted)) (second Sorted)])))

(define bubble-sort
  Lst ->
    (let Result (bubble-pass Lst)
      (if (second Result)
        (bubble-sort (head Result))
        (head Result))))

(print (bubble-sort [64 34 25 12 22 11 90]))
