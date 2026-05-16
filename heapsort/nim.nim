proc heapify(arr: var seq[int], n, i: int) =
  var largest = i
  let left = 2 * i + 1
  let right = 2 * i + 2
  if left < n and arr[left] > arr[largest]: largest = left
  if right < n and arr[right] > arr[largest]: largest = right
  if largest != i:
    swap(arr[i], arr[largest])
    heapify(arr, n, largest)

proc heapsort(arr: var seq[int]) =
  let n = arr.len
  for i in countdown(n div 2 - 1, 0): heapify(arr, n, i)
  for i in countdown(n - 1, 1):
    swap(arr[0], arr[i])
    heapify(arr, i, 0)

var arr = @[12, 11, 13, 5, 6, 7]
heapsort(arr)
echo arr
