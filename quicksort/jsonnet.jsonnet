local quicksort(arr) =
  if std.length(arr) <= 1
  then arr
  else
    local pivot = arr[std.floor(std.length(arr) / 2)];
    local left = std.filter(function(x) x < pivot, arr);
    local middle = std.filter(function(x) x == pivot, arr);
    local right = std.filter(function(x) x > pivot, arr);
    quicksort(left) + middle + quicksort(right);

quicksort([3, 6, 8, 10, 1, 2, 1])
