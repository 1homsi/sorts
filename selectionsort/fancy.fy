def selection_sort: arr {
  n = arr size
  0 to: n - 1 do: |i| {
    min_idx = i
    i + 1 to: n - 1 do: |j| {
      arr[j] < arr[min_idx] if_true: { min_idx = j }
    }
    tmp = arr[i]
    arr[i] = arr[min_idx]
    arr[min_idx] = tmp
  }
  arr
}
