def is_sorted(arr : Array(Int32)) : Bool
  (0...arr.size - 1).each do |i|
    return false if arr[i] > arr[i + 1]
  end
  true
end

def bogosort(arr : Array(Int32)) : Array(Int32)
  arr = arr.dup
  arr.shuffle! until is_sorted(arr)
  arr
end

arr = [3, 1, 4, 1, 5, 9, 2, 6]
puts bogosort(arr).inspect
