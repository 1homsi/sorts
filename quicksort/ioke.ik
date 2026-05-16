quicksort = method(lst,
  if(lst length <= 1,
    lst,
    pivot = lst[lst length / 2],
    left = lst select(x, x < pivot),
    middle = lst select(x, x == pivot),
    right = lst select(x, x > pivot),
    quicksort(left) + middle + quicksort(right)
  )
)

println(quicksort([3, 6, 8, 10, 1, 2, 1]))
