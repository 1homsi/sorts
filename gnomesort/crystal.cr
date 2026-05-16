def gnome_sort(arr : Array(Int32)) : Array(Int32)
  i = 0
  while i < arr.size
    if i == 0 || arr[i] >= arr[i - 1]
      i += 1
    else
      arr[i], arr[i - 1] = arr[i - 1], arr[i]
      i -= 1
    end
  end
  arr
end
