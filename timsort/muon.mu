fn timsort(arr: [int], minSize: int) -> [int] {
  mergesort(arr, minSize)
}

fn mergesort(arr: [int], minSize: int) -> [int] {
  if arr.len() <= 1 {
    return arr
  }
  if arr.len() <= minSize {
    return insertionsort(arr)
  }
  
  let mid = arr.len() / 2
  let left = arr[0:mid]
  let right = arr[mid:]
  
  merge(mergesort(left, minSize), mergesort(right, minSize))
}

fn insertionsort(arr: [int]) -> [int] {
  let result = arr.clone()
  for i in 1..result.len() {
    let key = result[i]
    let j = (i - 1) as int
    loop {
      if j >= 0 && result[j] > key {
        result[j + 1] = result[j]
        j = j - 1
      } else {
        break
      }
    }
    result[j + 1] = key
  }
  result
}

fn merge(left: [int], right: [int]) -> [int] {
  let result = []
  let i = 0
  let j = 0
  
  loop {
    if i < left.len() && j < right.len() {
      if left[i] <= right[j] {
        result.push(left[i])
        i = i + 1
      } else {
        result.push(right[j])
        j = j + 1
      }
    } else {
      break
    }
  }
  
  loop {
    if i < left.len() {
      result.push(left[i])
      i = i + 1
    } else {
      break
    }
  }
  loop {
    if j < right.len() {
      result.push(right[j])
      j = j + 1
    } else {
      break
    }
  }
  
  result
}
