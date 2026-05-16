quicksort = (arr) ->
  return arr if arr.length <= 1
  pivot = arr[Math.floor arr.length / 2]
  left = (x for x in arr when x < pivot)
  middle = (x for x in arr when x is pivot)
  right = (x for x in arr when x > pivot)
  quicksort(left).concat(middle).concat(quicksort(right))

console.log quicksort [3, 6, 8, 10, 1, 2, 1]
