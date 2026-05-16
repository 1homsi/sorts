heapify = (arr, n, i) ->
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2
  largest = left if left < n and arr[left] > arr[largest]
  largest = right if right < n and arr[right] > arr[largest]
  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]
    heapify arr, n, largest

heapsort = (arr) ->
  n = #arr
  heapify arr, n, i for i = math.floor(n / 2), 1, -1
  for i = n, 2, -1
    arr[1], arr[i] = arr[i], arr[1]
    heapify arr, i - 1, 1
  arr

arr = {12, 11, 13, 5, 6, 7}
print table.concat heapsort(arr), " "
