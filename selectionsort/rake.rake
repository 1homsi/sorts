def selection_sort(arr)
  n = arr.length
  (0...n).each do |i|
    min_idx = i
    (i+1...n).each do |j|
      min_idx = j if arr[j] < arr[min_idx]
    end
    arr[i], arr[min_idx] = arr[min_idx], arr[i]
  end
  arr
end

task :sort do
  puts selection_sort([5, 3, 1, 4, 2]).inspect
end
