local arr = [3, 1, 4, 1, 5, 9, 2, 6];

local isSorted(a) =
  std.foldl(
    function(acc, i) acc && a[i] <= a[i+1],
    std.range(0, std.length(a) - 2),
    true
  );

local bogosort(a) =
  if isSorted(a) then a
  else bogosort(std.sort(a));

bogosort(arr)
