/* Cocktail Sort in REXX */
cocktailSort: procedure
  parse arg arr., n
  swapped = 1
  start = 1
  ending = n
  do while swapped
    swapped = 0
    do i = start to ending - 1
      if arr.i > arr.(i+1) then do
        tmp = arr.i
        arr.i = arr.(i+1)
        arr.(i+1) = tmp
        swapped = 1
      end
    end
    if swapped = 0 then return
    swapped = 0
    ending = ending - 1
    do i = ending - 1 to start by -1
      if arr.i > arr.(i+1) then do
        tmp = arr.i
        arr.i = arr.(i+1)
        arr.(i+1) = tmp
        swapped = 1
      end
    end
    start = start + 1
  end
  return
