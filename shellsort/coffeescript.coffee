shellSort = (arr) ->
  n = arr.length
  gap = Math.floor(n / 2)
  while gap > 0
    for i in [gap...n]
      temp = arr[i]
      j = i
      while j >= gap and arr[j - gap] > temp
        arr[j] = arr[j - gap]
        j -= gap
      arr[j] = temp
    gap = Math.floor(gap / 2)
  arr

arr = [64, 34, 25, 12, 22, 11, 90]
console.log shellSort(arr)
