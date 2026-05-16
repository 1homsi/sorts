function! Quicksort(arr)
  if len(a:arr) <= 1
    return a:arr
  endif
  let pivot = a:arr[0]
  let less = []
  let greater = []
  for i in range(1, len(a:arr) - 1)
    if a:arr[i] <= pivot
      call add(less, a:arr[i])
    else
      call add(greater, a:arr[i])
    endif
  endfor
  return Quicksort(less) + [pivot] + Quicksort(greater)
endfunction

echo Quicksort([5, 2, 8, 1, 9, 3])