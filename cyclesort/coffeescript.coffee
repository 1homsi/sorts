cycleSort = (arr) ->
  writes = 0
  n = arr.length
  for cycleStart in [0...n-1]
    item = arr[cycleStart]
    pos = cycleStart
    for i in [cycleStart+1...n]
      pos++ if arr[i] < item
    continue if pos is cycleStart
    pos++ while item is arr[pos]
    [arr[pos], item] = [item, arr[pos]]
    writes++
    while pos isnt cycleStart
      pos = cycleStart
      for i in [cycleStart+1...n]
        pos++ if arr[i] < item
      pos++ while item is arr[pos]
      [arr[pos], item] = [item, arr[pos]]
      writes++
  writes

arr = [5, 4, 3, 2, 1]
cycleSort(arr)
console.log arr
