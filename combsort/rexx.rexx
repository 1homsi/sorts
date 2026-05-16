combsort: procedure
  parse arg n
  gap = n
  sorted = 0
  do while sorted = 0
    gap = trunc(gap / 1.3)
    if gap <= 1 then do
      gap = 1
      sorted = 1
    end
    do i = 1 to n - gap
      if arr.i > arr.(i + gap) then do
        tmp = arr.i
        arr.i = arr.(i + gap)
        arr.(i + gap) = tmp
        sorted = 0
      end
    end
  end
  return
