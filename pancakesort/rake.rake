def flip(arr, k)
  left, right = 0, k
  while left < right
    arr[left], arr[right] = arr[right], arr[left]
    left += 1; right -= 1
  end
end

def pancake_sort(arr)
  size = arr.length
  while size > 1
    max_idx = (0...size).max_by { |i| arr[i] }
    if max_idx != size - 1
      flip(arr, max_idx) if max_idx != 0
      flip(arr, size - 1)
    end
    size -= 1
  end
  arr
end

task :sort do
  arr = [3, 6, 2, 7, 4, 1, 5]
  puts pancake_sort(arr).inspect
end

task default: :sort
