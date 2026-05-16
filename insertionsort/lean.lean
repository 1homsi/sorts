def insert (x : Nat) : List Nat → List Nat
  | [] => [x]
  | h :: t => if x ≤ h then x :: h :: t else h :: insert x t

def insertionSort : List Nat → List Nat
  | [] => []
  | h :: t => insert h (insertionSort t)
