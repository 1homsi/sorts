function! InsertionSort(arr)
  let n = len(a:arr)
  for i in range(1, n - 1)
    let key = a:arr[i]
    let j = i - 1
    while j >= 0 && a:arr[j] > key
      let a:arr[j + 1] = a:arr[j]
      let j -= 1
    endwhile
    let a:arr[j + 1] = key
  endfor
  return a:arr
endfunction

echo InsertionSort([5, 2, 8, 1, 9, 3])