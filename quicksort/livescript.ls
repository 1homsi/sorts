quicksort = (arr) ->
  return arr if arr.length <= 1
  pivot = arr[Math.floor arr.length / 2]
  left = arr.filter (x) -> x < pivot
  middle = arr.filter (x) -> x == pivot
  right = arr.filter (x) -> x > pivot
  (quicksort left) ++ middle ++ (quicksort right)

console.log quicksort [3, 6, 8, 10, 1, 2, 1]
