quicksort =: 3 : 0
  if. 1 >: #y do. y
  else.
    pivot =. y {~ <. 2 %~ #y
    left =. quicksort y #~ y < pivot
    middle =. y #~ y = pivot
    right =. quicksort y #~ y > pivot
    left , middle , right
  end.
)

quicksort 3 6 8 10 1 2 1
