function! Shellsort(arr)
  let n = len(a:arr)
  let gap = 1
  while gap <= n
    let gap = gap * 3 + 1
  endwhile
  while gap > 0
    let gap = gap / 3
    for i in range(gap, n - 1)
      let temp = a:arr[i]
      let j = i
      while j >= gap && a:arr[j - gap] > temp
        let a:arr[j] = a:arr[j - gap]
        let j = j - gap
      endwhile
      let a:arr[j] = temp
    endfor
  endwhile
  return a:arr
endfunction
echo Shellsort([5, 2, 8, 1, 9, 3])
