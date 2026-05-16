function! CountingSort(arr) abort
  if empty(a:arr)
    return []
  endif

  let l:max = max(a:arr)
  let l:count = repeat([0], l:max + 1)

  for l:val in a:arr
    let l:count[l:val] += 1
  endfor

  let l:output = []
  for l:i in range(l:max + 1)
    for l:j in range(l:count[l:i])
      call add(l:output, l:i)
    endfor
  endfor

  return l:output
endfunction

echo CountingSort([5, 2, 8, 1, 9, 3])
