def flip(arr, k)
  arr[0..k] = arr[0..k].reverse
end

def pancake_sort(arr)
  size = arr.length
  while size > 1
    max_idx = arr[0...size].each_with_index.max[1]
    if max_idx != size - 1
      flip(arr, max_idx) if max_idx != 0
      flip(arr, size - 1)
    end
    size -= 1
  end
  arr
end

arr = [3, 6, 2, 7, 4, 1, 5]
p pancake_sort(arr)
