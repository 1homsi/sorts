fun gnome-sort(lst :: List<Number>) -> List<Number>:
  arr = array-from-list(lst)
  n = array-length(arr)
  var i = 0
  while i < n:
    if (i == 0) or (array-get-now(arr, i) >= array-get-now(arr, i - 1)):
      i := i + 1
    else:
      tmp = array-get-now(arr, i)
      array-set-now(arr, i, array-get-now(arr, i - 1))
      array-set-now(arr, i - 1, tmp)
      i := i - 1
    end
  end
  array-to-list-now(arr)
end
