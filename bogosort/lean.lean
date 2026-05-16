def isSorted : List Nat → Bool
  | [] => true
  | [_] => true
  | x :: y :: rest => x ≤ y && isSorted (y :: rest)

def arr : List Nat := [3, 1, 4, 1, 5, 9, 2, 6]

#eval isSorted arr
#eval isSorted (arr.mergeSort (· ≤ ·))
