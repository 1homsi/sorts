actor Main
  new create(env: Env) =>
    let arr: Array[I64] = [12; 11; 13; 5; 6; 7]
    heapsort(arr)
    for x in arr.values() do
      env.out.write(x.string() + " ")
    end
    env.out.print("")

  fun heapify(arr: Array[I64], n: USize, i: USize) =>
    var largest: USize = i
    let left: USize = (2 * i) + 1
    let right: USize = (2 * i) + 2
    try
      if (left < n) and (arr(left)? > arr(largest)?) then largest = left end
      if (right < n) and (arr(right)? > arr(largest)?) then largest = right end
      if largest != i then
        let tmp = arr(i)?
        arr(i)? = arr(largest)?
        arr(largest)? = tmp
        heapify(arr, n, largest)
      end
    end

  fun heapsort(arr: Array[I64]) =>
    let n: USize = arr.size()
    var i: ISize = ((n / 2) - 1).isize()
    while i >= 0 do
      heapify(arr, n, i.usize())
      i = i - 1
    end
    i = (n - 1).isize()
    while i > 0 do
      try
        let tmp = arr(0)?
        arr(0)? = arr(i.usize())?
        arr(i.usize())? = tmp
      end
      heapify(arr, i.usize(), 0)
      i = i - 1
    end
