function! BucketSort(arr, maxVal)
  if a:maxVal == 0 | return a:arr | endif
  let buckets = []
  for i in range(a:maxVal)
    call add(buckets, [])
  endfor
  for num in a:arr
    let idx = num
    if idx >= 0 && idx < a:maxVal
      call add(buckets[idx], num)
    endif
  endfor
  let result = []
  for i in range(a:maxVal)
    for num in buckets[i]
      call add(result, num)
    endfor
  endfor
  return result
endfunction
echo BucketSort([5, 2, 8, 1, 9, 3], 10)