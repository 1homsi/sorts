TimSort: class {
  timsort: static func(arr: List<Int>, minSize: Int := 32) -> List<Int> {
    return mergesort(arr, minSize)
  }
  
  mergesort: static func(arr: List<Int>, minSize: Int) -> List<Int> {
    if (arr size <= 1) {
      return arr
    }
    if (arr size <= minSize) {
      return insertionsort(arr)
    }
    
    mid := arr size / 2
    left := arr slice(0, mid)
    right := arr slice(mid)
    
    return merge(mergesort(left, minSize), mergesort(right, minSize))
  }
  
  insertionsort: static func(arr: List<Int>) -> List<Int> {
    result := arr clone()
    for (i in 1..result size) {
      key := result[i]
      j := i - 1
      while (j >= 0 && result[j] > key) {
        result[j + 1] = result[j]
        j -= 1
      }
      result[j + 1] = key
    }
    return result
  }
  
  merge: static func(left: List<Int>, right: List<Int>) -> List<Int> {
    result := List<Int> new()
    i := 0
    j := 0
    
    while (i < left size && j < right size) {
      if (left[i] <= right[j]) {
        result add(left[i])
        i += 1
      } else {
        result add(right[j])
        j += 1
      }
    }
    
    while (i < left size) {
      result add(left[i])
      i += 1
    }
    while (j < right size) {
      result add(right[j])
      j += 1
    }
    
    return result
  }
}

arr := [5, 2, 8, 1, 9, 3] as List
TimSort timsort(arr) println()
