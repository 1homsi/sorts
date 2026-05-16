def merge(left : Array(Int32), right : Array(Int32)) : Array(Int32)
  result = [] of Int32
  i, j = 0, 0
  while i < left.size && j < right.size
    if left[i] <= right[j]
      result << left[i]
      i += 1
    else
      result << right[j]
      j += 1
    end
  end
  result + left[i..] + right[j..]
end

def merge_sort(arr : Array(Int32)) : Array(Int32)
  return arr if arr.size <= 1
  mid = arr.size // 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..])
  merge(left, right)
end

arr = [38, 27, 43, 3, 9, 82, 10]
puts merge_sort(arr).inspect
