BogSort: class {
  bogosort: static func(arr: Vector<Int>) -> Vector<Int> {
    while (!issorted(arr)) {
      shuffle(arr)
    }
    return arr
  }

  issorted: static func(arr: Vector<Int>) -> Bool {
    for (i in 0..arr size - 1) {
      if (arr[i] > arr[i + 1]) {
        return false
      }
    }
    return true
  }

  shuffle: static func(arr: Vector<Int>) {
    for (i in 0..arr size) {
      j := random(arr size)
      tmp := arr[i]
      arr[i] = arr[j]
      arr[j] = tmp
    }
  }
}

arr := Vector<Int> new()
arr add(3) add(1) add(2)
BogSort bogosort(arr) println()
