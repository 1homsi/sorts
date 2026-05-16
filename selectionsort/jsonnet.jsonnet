local selectionSort(arr) =
  local n = std.length(arr);
  local loop(arr, i) =
    if i >= n then arr
    else
      local findMin(j, minIdx) =
        if j >= n then minIdx
        else if arr[j] < arr[minIdx] then findMin(j+1, j)
        else findMin(j+1, minIdx);
      local minIdx = findMin(i+1, i);
      local tmp = arr[i];
      local newArr = arr[:i] + [arr[minIdx]] + arr[i+1:minIdx] + [tmp] + arr[minIdx+1:];
      loop(newArr, i+1);
  loop(arr, 0);

selectionSort([5, 3, 1, 4, 2])
