quicksort = (arr) ->
  return arr if #arr <= 1
  pivot = arr[math.floor(#arr / 2)]
  left = [x for x in *arr when x < pivot]
  middle = [x for x in *arr when x == pivot]
  right = [x for x in *arr when x > pivot]
  [quicksort(left)..., middle..., quicksort(right)...]

print table.concat quicksort({3, 6, 8, 10, 1, 2, 1}), " "
