def cocktail_sort(arr)
  swapped = true
  start = 0
  ending = arr.length - 1
  while swapped
    swapped = false
    (start...ending).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    break unless swapped
    swapped = false
    ending -= 1
    (ending - 1).downto(start) do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    start += 1
  end
  arr
end

task :sort do
  arr = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]
  puts cocktail_sort(arr).inspect
end
