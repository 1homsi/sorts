def quicksort(arr : Array(Int32)) : Array(Int32)
  return arr if arr.size <= 1
  pivot = arr[arr.size // 2]
  left = arr.select { |x| x < pivot }
  middle = arr.select { |x| x == pivot }
  right = arr.select { |x| x > pivot }
  quicksort(left) + middle + quicksort(right)
end

p quicksort([3, 6, 8, 10, 1, 2, 1])
