def merge(arr, left, mid, right) {
  var i = left
  var j = mid + 1
  var result = []
  
  while (i <= mid && j <= right) {
    if (arr[i] <= arr[j]) {
      result.push(arr[i])
      i = i + 1
    } else {
      result.push(arr[j])
      j = j + 1
    }
  }
  
  while (i <= mid) {
    result.push(arr[i])
    i = i + 1
  }
  
  while (j <= right) {
    result.push(arr[j])
    j = j + 1
  }
  
  for (var k = 0; k < result.len(); k = k + 1) {
    arr[left + k] = result[k]
  }
}

def mergesort(arr, left, right) {
  if (left < right) {
    var mid = (left + right) / 2
    mergesort(arr, left, mid)
    mergesort(arr, mid + 1, right)
    merge(arr, left, mid, right)
  }
}

var arr = [5, 2, 8, 1, 9, 3]
mergesort(arr, 0, 5)
print(arr)
