def flip(arr : Array(Int32), k : Int32)
  left, right = 0, k
  while left < right
    arr[left], arr[right] = arr[right], arr[left]
    left += 1; right -= 1
  end
end

def pancake_sort(arr : Array(Int32))
  size = arr.size
  while size > 1
    max_idx = 0
    (1...size).each do |i|
      max_idx = i if arr[i] > arr[max_idx]
    end
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
