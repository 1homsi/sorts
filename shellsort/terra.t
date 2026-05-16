local function shellsort(arr)
  local n = #arr
  local gap = 1
  while gap <= n do gap = gap * 3 + 1 end
  while gap > 0 do
    gap = gap / 3
    for i = gap, n - 1 do
      local temp = arr[i]
      local j = i
      while j >= gap and arr[j - gap] > temp do
        arr[j] = arr[j - gap]
        j = j - gap
      end
      arr[j] = temp
    end
  end
  return arr
end
print(table.concat(shellsort({5, 2, 8, 1, 9, 3}), " "))
