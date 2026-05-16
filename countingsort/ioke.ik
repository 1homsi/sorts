countingSort = method(arr,
  n = arr length
  if(n == 0, return arr)
  min = arr inject(arr[0], m, v, if(v < m, v, m))
  max = arr inject(arr[0], m, v, if(v > m, v, m))
  range = max - min + 1
  count = 0 repeated(range) asList
  arr each(v, count[v - min] = count[v - min] + 1)
  1 to(range - 1) each(i, count[i] = count[i] + count[i - 1])
  output = 0 repeated(n) asList
  (n - 1) to(0) each(i,
    v = arr[i]
    idx = v - min
    count[idx] = count[idx] - 1
    output[count[idx]] = v)
  output)

countingSort([4, 2, 2, 8, 3, 3, 1]) println
