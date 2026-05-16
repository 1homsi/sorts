local cycleSort(arr) =
  local n = std.length(arr);
  local countSmaller(a, item) =
    std.length(std.filter(function(x) x < item, a));
  local step(a, i) =
    if i >= n - 1 then a
    else
      local item = a[i];
      local pos = i + countSmaller(a[i+1:], item);
      local a2 = if pos == i then a
                 else a[:i] + [a[pos]] + a[i+1:pos] + [item] + a[pos+1:];
      step(a2, i + 1);
  step(arr, 0);

cycleSort([5, 4, 3, 2, 1])
