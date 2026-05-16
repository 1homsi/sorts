function Merge(arr, left, mid, right)
  let i = a:left
  let j = a:mid + 1
  let k = 0
  let result = []
  
  while i <= a:mid && j <= a:right
    if a:arr[i] <= a:arr[j]
      call add(result, a:arr[i])
      let i += 1
    else
      call add(result, a:arr[j])
      let j += 1
    endif
  endwhile
  
  while i <= a:mid
    call add(result, a:arr[i])
    let i += 1
  endwhile
  
  while j <= a:right
    call add(result, a:arr[j])
    let j += 1
  endwhile
  
  let k = 0
  for idx in range(a:left, a:right)
    let a:arr[idx] = result[k]
    let k += 1
  endfor
endfunction

function MergeSort(arr, left, right)
  if a:left < a:right
    let mid = (a:left + a:right) / 2
    call MergeSort(a:arr, a:left, mid)
    call MergeSort(a:arr, mid + 1, a:right)
    call Merge(a:arr, a:left, mid, a:right)
  endif
endfunction

let arr = [5, 2, 8, 1, 9, 3]
call MergeSort(arr, 0, 5)
echo arr
