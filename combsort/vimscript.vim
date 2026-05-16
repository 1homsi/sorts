function! CombSort(arr)
  let gap = len(a:arr)
  while gap > 1
    let gap = gap * 10 / 13
    if gap < 1
      let gap = 1
    endif
    for i in range(len(a:arr) - gap)
      if a:arr[i] > a:arr[i + gap]
        let temp = a:arr[i]
        let a:arr[i] = a:arr[i + gap]
        let a:arr[i + gap] = temp
      endif
    endfor
    if gap == 1
      break
    endif
  endwhile
  return a:arr
endfunction

let sample = [5, 2, 8, 1, 9, 3]
echo CombSort(sample)
