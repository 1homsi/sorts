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
  lp = arr[left..mid].dup
  rp = arr[(mid + 1)..right].dup
  i, j, k = 0, 0, left
  while i < lp.size && j < rp.size
    if lp[i] <= rp[j]
      arr[k] = lp[i]; i += 1
    else
      arr[k] = rp[j]; j += 1
    end
    k += 1
  end
  while i < lp.size; arr[k] = lp[i]; i += 1; k += 1; end
  while j < rp.size; arr[k] = rp[j]; j += 1; k += 1; end
end

def timsort(arr)
  n = arr.size
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

arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
p timsort(arr)
