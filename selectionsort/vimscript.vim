function SelectionSort(arr)
  let n = len(a:arr)
  for i in range(0, n - 2)
    let min_idx = i
    for j in range(i + 1, n - 1)
      if a:arr[j] < a:arr[min_idx]
        let min_idx = j
      endif
    endfor
    let tmp = a:arr[i]
    let a:arr[i] = a:arr[min_idx]
    let a:arr[min_idx] = tmp
  endfor
  return a:arr
endfunction

echo SelectionSort([5, 2, 8, 1, 9, 3])