terra stoogesort(a : &int, i : int, j : int)
  if a[j] < a[i] then
    var temp = a[j]
    a[j] = a[i]
    a[i] = temp
  end
  if j - i > 1 then
    var t = (j - i + 1) / 3
    stoogesort(a, i, j - t)
    stoogesort(a, i + t, j)
    stoogesort(a, i, j - t)
  end
end

terra main()
  var arr : int[6] = array(5, 2, 8, 1, 9, 3)
  stoogesort(&arr[0], 0, 5)
  std.printf("%d %d %d %d %d %d\n", arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
end

main()
