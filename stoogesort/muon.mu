stoogesort = fn (a, i, j) =>
  if a[j] < a[i] then
    (a.insert(i, a[j]), a.remove(j))
  else
    ()
  ,
  if j - i > 1 then
    let t = (j - i + 1) / 3
    (stoogesort(a, i, j - t),
     stoogesort(a, i + t, j),
     stoogesort(a, i, j - t))
  else
    ()

arr = [5, 2, 8, 1, 9, 3]
stoogesort(arr, 0, 5)
print(arr)
