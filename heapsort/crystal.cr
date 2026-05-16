def heapify(arr, n, i)
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2
  largest = left if left < n && arr[left] > arr[largest]
  largest = right if right < n && arr[right] > arr[largest]
  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]
    heapify(arr, n, largest)
  end
end

def heapsort(arr)
  n = arr.size
  (n // 2 - 1).downto(0) { |i| heapify(arr, n, i) }
  (n - 1).downto(1) do |i|
    arr[0], arr[i] = arr[i], arr[0]
    heapify(arr, i, 0)
  end
  arr
end

arr = [12, 11, 13, 5, 6, 7]
puts heapsort(arr).inspect
