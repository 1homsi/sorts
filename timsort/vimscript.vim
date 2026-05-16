function! Timsort(arr, minSize)
  return Mergesort(a:arr, a:minSize)
endfunction

function! Mergesort(arr, minSize)
  if len(a:arr) <= 1
    return a:arr
  endif
  if len(a:arr) <= a:minSize
    return Insertionsort(a:arr)
  endif
  
  let mid = len(a:arr) / 2
  let left = a:arr[0:mid-1]
  let right = a:arr[mid:]
  
  return Merge(Mergesort(left, a:minSize), Mergesort(right, a:minSize))
endfunction

function! Insertionsort(arr)
  let result = copy(a:arr)
  for i in range(1, len(result) - 1)
    let key = result[i]
    let j = i - 1
    while j >= 0 && result[j] > key
      let result[j + 1] = result[j]
      let j = j - 1
    endwhile
    let result[j + 1] = key
  endfor
  return result
endfunction

function! Merge(left, right)
  let result = []
  let i = 0
  let j = 0
  
  while i < len(a:left) && j < len(a:right)
    if a:left[i] <= a:right[j]
      call add(result, a:left[i])
      let i = i + 1
    else
      call add(result, a:right[j])
      let j = j + 1
    endif
  endwhile
  
  while i < len(a:left)
    call add(result, a:left[i])
    let i = i + 1
  endwhile
  while j < len(a:right)
    call add(result, a:right[j])
    let j = j + 1
  endwhile
  
  return result
endfunction

echo Timsort([5, 2, 8, 1, 9, 3], 32)
