isSorted = (arr) ->
  for i in [0...arr.length - 1]
    return false if arr[i] > arr[i + 1]
  true

shuffle = (arr) ->
  for i in [arr.length - 1..1]
    j = Math.floor(Math.random() * (i + 1))
    [arr[i], arr[j]] = [arr[j], arr[i]]
  arr

bogosort = (arr) ->
  arr = arr.slice()
  arr = shuffle(arr) until isSorted(arr)
  arr

arr = [3, 1, 4, 1, 5, 9, 2, 6]
console.log bogosort(arr)
