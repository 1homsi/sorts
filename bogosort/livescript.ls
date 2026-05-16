is-sorted = (arr) ->
  for i from 0 to arr.length - 2
    return false if arr[i] > arr[i + 1]
  true

shuffle = (arr) ->
  a = arr.slice 0
  n = a.length
  for i from n - 1 to 1 by -1
    j = Math.floor Math.random! * (i + 1)
    [a[i], a[j]] = [a[j], a[i]]
  a

bogosort = (arr) ->
  a = arr.slice 0
  until is-sorted a
    a = shuffle a
  a

arr = [3, 1, 4, 1, 5, 9, 2, 6]
console.log bogosort arr
