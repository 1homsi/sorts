local compareAndSwap(arr, i, j, direction) =
  local ai = arr[i];
  local aj = arr[j];
  if direction == (ai > aj) then
    [if k == i then aj else if k == j then ai else arr[k]
     for k in std.range(0, std.length(arr) - 1)]
  else arr;

local bitonicMerge(arr, lo, cnt, direction) =
  if cnt <= 1 then arr
  else
    local k = std.floor(cnt / 2);
    local arr2 = std.foldl(
      function(a, i) compareAndSwap(a, i, i + k, direction),
      std.range(lo, lo + k - 1), arr);
    local arr3 = bitonicMerge(arr2, lo, k, direction);
    bitonicMerge(arr3, lo + k, k, direction);

local bitonicSort(arr, lo, cnt, direction) =
  if cnt <= 1 then arr
  else
    local k = std.floor(cnt / 2);
    local arr2 = bitonicSort(arr, lo, k, true);
    local arr3 = bitonicSort(arr2, lo + k, k, false);
    bitonicMerge(arr3, lo, cnt, direction);

local data = [3, 7, 4, 8, 6, 2, 1, 5];
bitonicSort(data, 0, std.length(data), true)
