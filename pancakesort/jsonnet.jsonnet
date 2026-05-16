local flip(arr, k) =
  std.makeArray(std.length(arr), function(i)
    if i <= k then arr[k - i]
    else arr[i]
  );

local findMaxIdx(arr, size) =
  local sub = arr[0:size];
  local maxVal = std.foldl(function(a, b) if b > a then b else a, sub, sub[0]);
  local indices = std.range(0, size - 1);
  std.foldl(function(acc, i) if sub[i] == maxVal then i else acc, indices, 0);

local rec pancakeSort(arr, size) =
  if size <= 1 then arr
  else
    local mi = findMaxIdx(arr, size);
    local arr1 = if mi != 0 then flip(arr, mi) else arr;
    local arr2 = flip(arr1, size - 1);
    pancakeSort(arr2, size - 1);

pancakeSort([3, 6, 2, 7, 4, 1, 5], 7)
