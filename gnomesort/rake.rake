def gnome_sort(arr)
  i = 0
  while i < arr.length
    if i == 0 || arr[i] >= arr[i - 1]
      i += 1
    else
      arr[i], arr[i - 1] = arr[i - 1], arr[i]
      i -= 1
    end
  end
  arr
end

task :sort do
  arr = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]
  puts gnome_sort(arr).inspect
end
