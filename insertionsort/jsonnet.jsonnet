local insert(x, lst) =
  if std.length(lst) == 0 then [x]
  else if x <= lst[0] then [x] + lst
  else [lst[0]] + insert(x, lst[1:]);

local insertionSort(lst) =
  if std.length(lst) == 0 then []
  else insert(lst[0], insertionSort(lst[1:]));

insertionSort([5, 3, 1, 4, 2])
