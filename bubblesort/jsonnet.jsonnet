local bubblePass(arr) =
  local n = std.length(arr);
  local step(acc, i) =
    local a = acc.arr;
    local xi = a[i];
    local xi1 = a[i + 1];
    if xi > xi1 then
      { arr: [if j == i then xi1 else if j == i + 1 then xi else a[j] for j in std.range(0, n - 1)], swapped: true }
    else
      { arr: a, swapped: acc.swapped };
  std.foldl(step, std.range(0, n - 2), { arr: arr, swapped: false });

local rec bubbleSort(arr) =
  local result = bubblePass(arr);
  if result.swapped then bubbleSort(result.arr) else result.arr;

bubbleSort([64, 34, 25, 12, 22, 11, 90])
