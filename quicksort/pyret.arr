fun quicksort(lst :: List<Number>) -> List<Number>:
  if lst.length() <= 1:
    lst
  else:
    pivot = lst.get(lst.length() / 2)
    left = lst.filter(lam(x): x < pivot end)
    middle = lst.filter(lam(x): x == pivot end)
    right = lst.filter(lam(x): x > pivot end)
    quicksort(left) + middle + quicksort(right)
  end
end

result = quicksort([list: 3, 6, 8, 10, 1, 2, 1])
print(result)
