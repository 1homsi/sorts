def bubble_sort: arr {
  n = arr size
  swapped = true
  while: { swapped } do: {
    swapped = false
    0 upto: (n - 2) do: |i| {
      if: (arr[i] > arr[i + 1]) then: {
        tmp = arr[i]
        arr[i] = arr[i + 1]
        arr[i + 1] = tmp
        swapped = true
      }
    }
    n = n - 1
  }
  arr
}

arr = [64, 34, 25, 12, 22, 11, 90]
bubble_sort(arr) println
