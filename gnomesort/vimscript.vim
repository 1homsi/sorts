function! GnomeSort(arr)
  let i = 0
  while i < len(a:arr)
    if i == 0
      let i += 1
    elseif a:arr[i] < a:arr[i - 1]
      let temp = a:arr[i]
      let a:arr[i] = a:arr[i - 1]
      let a:arr[i - 1] = temp
      let i -= 1
    else
      let i += 1
    endif
  endwhile
  return a:arr
endfunction

let test = [5, 2, 8, 1, 9, 3]
echo GnomeSort(test)
