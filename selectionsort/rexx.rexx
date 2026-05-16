selection_sort: procedure
  parse arg arr
  n = words(arr)
  do i = 1 to n - 1
    minIdx = i
    do j = i + 1 to n
      if word(arr, j) < word(arr, minIdx) then minIdx = j
    end
    tmp = word(arr, i)
    arr = delword(arr, i, 1)
    arr = insert(word(arr, minIdx-1), arr, i-1)
    arr = delword(arr, minIdx, 1)
    arr = insert(tmp, arr, minIdx-1)
  end
  return arr
