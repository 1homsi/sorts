function RadixSort(arr)
  let max = max(a:arr)
  let exp = 1
  while max / exp > 0
    let a:arr = CountingSortByExp(a:arr, exp)
    let exp = exp * 10
  endwhile
  return a:arr
endfunction

function CountingSortByExp(arr, exp)
  let n = len(a:arr)
  let output = repeat([0], n)
  let count = repeat([0], 10)
  for i in range(n)
    let idx = (a:arr[i] / a:exp) % 10
    let count[idx] += 1
  endfor
  for i in range(1, 10)
    let count[i] += count[i - 1]
  endfor
  for i in range(n - 1, -1, -1)
    let idx = (a:arr[i] / a:exp) % 10
    let output[count[idx] - 1] = a:arr[i]
    let count[idx] -= 1
  endfor
  return output
endfunction

echo RadixSort([5, 2, 8, 1, 9, 3])
