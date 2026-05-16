def bubble_sort(arr)
  n = arr.length
  loop do
    swapped = false
    (n - 1).times do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    n -= 1
    break unless swapped
  end
  arr
end

task :sort do
  arr = [64, 34, 25, 12, 22, 11, 90]
  puts bubble_sort(arr).inspect
end

task default: :sort
