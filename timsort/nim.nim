const MIN_RUN = 32

proc insertionSort(arr: var seq[int], left, right: int) =
  for i in left + 1 .. right:
    let key = arr[i]
    var j = i - 1
    while j >= left and arr[j] > key:
      arr[j + 1] = arr[j]
      dec j
    arr[j + 1] = key

proc merge(arr: var seq[int], left, mid, right: int) =
  let lp = arr[left .. mid]
  let rp = arr[mid + 1 .. right]
  var i, j = 0
  var k = left
  while i < lp.len and j < rp.len:
    if lp[i] <= rp[j]:
      arr[k] = lp[i]; inc i
    else:
      arr[k] = rp[j]; inc j
    inc k
  while i < lp.len: arr[k] = lp[i]; inc i; inc k
  while j < rp.len: arr[k] = rp[j]; inc j; inc k

proc timsort(arr: var seq[int]) =
  let n = arr.len
  var i = 0
  while i < n:
    insertionSort(arr, i, min(i + MIN_RUN - 1, n - 1))
    i += MIN_RUN
  var size = MIN_RUN
  while size < n:
    var left = 0
    while left < n:
      let mid = min(left + size - 1, n - 1)
      let right = min(left + 2 * size - 1, n - 1)
      if mid < right: merge(arr, left, mid, right)
      left += 2 * size
    size *= 2

var arr = @[5, 2, 8, 1, 9, 3, 7, 4, 6]
timsort(arr)
echo arr
