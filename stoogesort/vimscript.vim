function Stoogesort(a, i, j)
  if a[a:j] < a[a:i]
    let [a[a:i], a[a:j]] = [a[a:j], a[a:i]]
  endif
  if a:j - a:i > 1
    let t = (a:j - a:i + 1) / 3
    call Stoogesort(a:a, a:i, a:j - t)
    call Stoogesort(a:a, a:i + t, a:j)
    call Stoogesort(a:a, a:i, a:j - t)
  endif
endfunction

let arr = [5, 2, 8, 1, 9, 3]
call Stoogesort(arr, 0, 5)
echo arr
