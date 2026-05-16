function! Bubblesort(arr)
  let n = len(a:arr)
  for i in range(n)
    for j in range(n - 1 - i)
      if a:arr[j] > a:arr[j + 1]
        let temp = a:arr[j]
        let a:arr[j] = a:arr[j + 1]
        let a:arr[j + 1] = temp
      endif
    endfor
  endfor
  return a:arr
endfunction

let result = Bubblesort([5, 2, 8, 1, 9, 3])
echo result