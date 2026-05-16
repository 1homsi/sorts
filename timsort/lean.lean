def insertVal (x : Nat) : List Nat → List Nat
  | [] => [x]
  | h :: t => if x ≤ h then x :: h :: t else h :: insertVal x t

def insertionSort : List Nat → List Nat
  | [] => []
  | h :: t => insertVal h (insertionSort t)

def mergeRuns : List Nat → List Nat → List Nat
  | [], ys => ys
  | xs, [] => xs
  | x :: xs, y :: ys =>
      if x ≤ y then x :: mergeRuns xs (y :: ys)
      else y :: mergeRuns (x :: xs) ys

def chunksOf (n : Nat) : List Nat → List (List Nat)
  | [] => []
  | xs => xs.take n :: chunksOf n (xs.drop n)

def mergePairs : List (List Nat) → List (List Nat)
  | [] => []
  | [x] => [x]
  | x :: y :: rest => mergeRuns x y :: mergePairs rest

def mergeAll : Nat → List (List Nat) → List Nat
  | _, [] => []
  | _, [x] => x
  | 0, xs => xs.join
  | n + 1, xs => mergeAll n (mergePairs xs)

def timsort (lst : List Nat) : List Nat :=
  if lst.isEmpty then []
  else
    let runs := (chunksOf 32 lst).map insertionSort
    mergeAll runs.length runs

#eval timsort [5, 2, 8, 1, 9, 3, 7, 4, 6]
