def selection_sort(arr : Array(Int32)) : Array(Int32)
  n = arr.size
  (0...n).each do |i|
    min_idx = i
    (i + 1...n).each do |j|
      min_idx = j if arr[j] < arr[min_idx]
    end
    arr[i], arr[min_idx] = arr[min_idx], arr[i]
  end
  arr
end
