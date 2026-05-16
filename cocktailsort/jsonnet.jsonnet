local cocktailSort(arr) =
  local n = std.length(arr);
  local swapAt(a, i, j) =
    [if k == i then a[j]
     else if k == j then a[i]
     else a[k]
     for k in std.range(0, n - 1)];
  local forward(a, i, end) =
    if i >= end then a
    else if a[i] > a[i + 1] then forward(swapAt(a, i, i + 1), i + 1, end)
    else forward(a, i + 1, end);
  local backward(a, i, start) =
    if i < start then a
    else if a[i] > a[i + 1] then backward(swapAt(a, i, i + 1), i - 1, start)
    else backward(a, i - 1, start);
  local go(a, s, e) =
    local a1 = forward(a, s, e);
    if a1 == a then a1
    else
      local a2 = backward(a1, e - 1, s);
      if a2 == a1 then a2
      else go(a2, s + 1, e - 1);
  if n <= 1 then arr
  else go(arr, 0, n - 1);

cocktailSort([5, 3, 8, 1, 9, 2, 7, 4, 6, 0])
