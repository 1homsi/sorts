gnomeSort =: monad define
  arr =. y
  n =. #arr
  i =. 0
  while. i < n do.
    if. (i = 0) +. (i { arr) >: ((i-1) { arr) do.
      i =. i + 1
    else.
      tmp =. i { arr
      arr =. (((i-1){arr) i} arr)
      arr =. (tmp (i-1)} arr)
      i =. i - 1
    end.
  end.
  arr
)
