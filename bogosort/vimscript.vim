function! BogSort(arr) abort
  while !s:IsSorted(a:arr)
    call s:Shuffle(a:arr)
  endwhile
  return a:arr
endfunction

function! s:IsSorted(arr) abort
  for i in range(len(a:arr) - 1)
    if a:arr[i] > a:arr[i + 1]
      return v:false
    endif
  endfor
  return v:true
endfunction

function! s:Shuffle(arr) abort
  for i in range(len(a:arr))
    let j = random(len(a:arr))
    let tmp = a:arr[i]
    let a:arr[i] = a:arr[j]
    let a:arr[j] = tmp
  endfor
endfunction

let arr = [3, 1, 2]
echo BogSort(arr)
