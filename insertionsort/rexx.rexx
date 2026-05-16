insertion_sort: procedure expose arr. n
  do i = 2 to n
    key = arr.i
    j = i - 1
    do while j >= 1 & arr.j > key
      arr.(j+1) = arr.j
      j = j - 1
    end
    arr.(j+1) = key
  end
  return
