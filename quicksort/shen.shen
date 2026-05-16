(define quicksort
  [] -> []
  [Pivot | Rest] ->
    (append
      (quicksort (filter (/. X (<= X Pivot)) Rest))
      [Pivot]
      (quicksort (filter (/. X (> X Pivot)) Rest))))

(define filter
  _ [] -> []
  F [H | T] -> [H | (filter F T)] where (F H)
  F [_ | T] -> (filter F T))

(output "~A~%" (quicksort [3 6 8 10 1 2 1]))
