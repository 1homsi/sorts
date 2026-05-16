MIN_RUN = 32

def insertion_sort(arr, left, right)
  (left + 1..right).each do |i|
    key = arr[i]
    j = i - 1
    while j >= left && arr[j] > key
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = key
  end
end

def merge(arr, left, mid, right)
  left_part = arr[left..mid].dup
  right_part = arr[(mid + 1)..right].dup
  i, j, k = 0, 0, left
  while i < left_part.length && j < right_part.length
    if left_part[i] <= right_part[j]
      arr[k] = left_part[i]; i += 1
    else
      arr[k] = right_part[j]; j += 1
    end
    k += 1
  end
  while i < left_part.length; arr[k] = left_part[i]; i += 1; k += 1; end
  while j < right_part.length; arr[k] = right_part[j]; j += 1; k += 1; end
end

def timsort(arr)
  n = arr.length
  i = 0
  while i < n
    insertion_sort(arr, i, [i + MIN_RUN - 1, n - 1].min)
    i += MIN_RUN
  end
  size = MIN_RUN
  while size < n
    left = 0
    while left < n
      mid = [left + size - 1, n - 1].min
      right = [left + 2 * size - 1, n - 1].min
      merge(arr, left, mid, right) if mid < right
      left += 2 * size
    end
    size *= 2
  end
  arr
end
