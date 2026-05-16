def heapify (arr : Array Int) (n i : Nat) : Array Int :=
  let largest0 := i
  let left := 2 * i + 1
  let right := 2 * i + 2
  let largest1 := if left < n && arr[left]! > arr[largest0]! then left else largest0
  let largest2 := if right < n && arr[right]! > arr[largest1]! then right else largest1
  if largest2 != i then
    let arr' := arr.swap! i largest2
    heapify arr' n largest2
  else arr
termination_by n - i

def heapsort (arr : Array Int) : Array Int :=
  let n := arr.size
  let arr1 := (List.range (n / 2)).foldr (fun i a => heapify a n (n / 2 - 1 - i)) arr
  (List.range (n - 1)).foldr (fun k a =>
    let i := n - 1 - k
    let a' := a.swap! 0 i
    heapify a' i 0) arr1

#eval heapsort #[12, 11, 13, 5, 6, 7]
