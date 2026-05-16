def quicksort(arr)
  return arr if arr.length <= 1
  pivot = arr[arr.length / 2]
  left = arr.select { |x| x < pivot }
  middle = arr.select { |x| x == pivot }
  right = arr.select { |x| x > pivot }
  quicksort(left) + middle + quicksort(right)
end

task :default do
  puts quicksort([3, 6, 8, 10, 1, 2, 1]).inspect
end
