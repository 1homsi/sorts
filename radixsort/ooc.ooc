RadixSort: class {
  static radixsort: func(arr: Int[]) -> Int[] {
    max := 0
    for x in arr {
      if x > max { max = x }
    }
    exp := 1
    while (max / exp > 0) {
      arr = countingSortByExp(arr, exp)
      exp = exp * 10
    }
    return arr
  }

  static countingSortByExp: func(arr: Int[], exp: Int) -> Int[] {
    n := arr length
    output := Int[n] new()
    count := Int[10] new()
    for i in 0..n {
      count[(arr[i] / exp) % 10] += 1
    }
    for i in 1..10 {
      count[i] += count[i - 1]
    }
    for i in n - 1..0 {
      output[count[(arr[i] / exp) % 10] - 1] = arr[i]
      count[(arr[i] / exp) % 10] -= 1
    }
    return output
  }
}

result := RadixSort radixsort([5, 2, 8, 1, 9, 3])
result println()
