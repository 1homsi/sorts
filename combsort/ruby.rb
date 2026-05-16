def comb_sort(arr)
  n = arr.length
  gap = n
  shrink = 1.3
  sorted = false
  until sorted
    gap = (gap / shrink).to_i
    if gap <= 1
      gap = 1
      sorted = true
    end
    (0...n - gap).each do |i|
      if arr[i] > arr[i + gap]
        arr[i], arr[i + gap] = arr[i + gap], arr[i]
        sorted = false
      end
    end
  end
  arr
end
