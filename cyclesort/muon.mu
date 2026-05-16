def cyclesort(arr):
  n = len(arr)
  pos = 0
  while pos < n:
    item = arr[pos]
    cycles = 0
    for i in range(n):
      if i != pos && arr[i] < item:
        cycles++
    if cycles != 0:
      while arr[pos] == item:
        pos++
      temp = arr[pos]
      arr[pos] = item
      item = temp
      while cycles > 0:
        cycles = 0
        for i in range(n):
          if i != pos && arr[i] < item:
            cycles++
        while arr[pos] == item:
          pos++
        temp = arr[pos]
        arr[pos] = item
        item = temp
        cycles--
    pos++
  return arr

print(cyclesort([5, 2, 8, 1, 9, 3]))
