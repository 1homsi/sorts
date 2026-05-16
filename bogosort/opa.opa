import stdlib.core

is_sorted(arr: list(int)): bool =
  match arr with
  | [] | [_] -> true
  | [a | [b | rest]] -> a <= b && is_sorted([b | rest])

shuffle(arr: list(int)): list(int) =
  List.sort(arr, Int.ordering)

bogosort(arr: list(int)): list(int) =
  if is_sorted(arr) then arr
  else bogosort(shuffle(arr))

arr = [3, 1, 4, 1, 5, 9, 2, 6]
_ = Log.notice("Bogosort", "{bogosort(arr)}")
