local shellSort(arr) =
  local n = std.length(arr);
  local sortPass(a, gap, i) =
    if i >= n then a
    else
      local temp = a[i];
      local shiftBack(a, j) =
        if j >= gap && a[j - gap] > temp then
          shiftBack(a[:j] + [a[j - gap]] + a[j+1:], j - gap)
        else
          a[:j] + [temp] + a[j+1:];
      sortPass(shiftBack(a, i), gap, i + 1);
  local gapLoop(a, gap) =
    if gap <= 0 then a
    else gapLoop(sortPass(a, gap, gap), std.floor(gap / 2));
  gapLoop(arr, std.floor(n / 2));

shellSort([64, 34, 25, 12, 22, 11, 90])
