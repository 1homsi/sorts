local minRun = 32;

local insertVal(x, lst) =
  if std.length(lst) == 0 then [x]
  else if x <= lst[0] then [x] + lst
  else [lst[0]] + insertVal(x, lst[1:]);

local insertionSort(lst) =
  if std.length(lst) == 0 then []
  else insertVal(lst[0], insertionSort(lst[1:]));

local mergeRuns(xs, ys) =
  if std.length(xs) == 0 then ys
  else if std.length(ys) == 0 then xs
  else if xs[0] <= ys[0]
    then [xs[0]] + mergeRuns(xs[1:], ys)
  else [ys[0]] + mergeRuns(xs, ys[1:]);

local chunksOf(n, lst) =
  if std.length(lst) == 0 then []
  else
    local end = std.min(n, std.length(lst));
    [lst[0:end]] + chunksOf(n, lst[end:]);

local mergePairs(runs) =
  local len = std.length(runs);
  if len == 0 then []
  else if len == 1 then runs
  else [mergeRuns(runs[0], runs[1])] + mergePairs(runs[2:]);

local mergeAll(runs) =
  if std.length(runs) == 1 then runs[0]
  else mergeAll(mergePairs(runs));

local timsort(lst) =
  if std.length(lst) == 0 then lst
  else
    local chunks = chunksOf(minRun, lst);
    local sorted = std.map(insertionSort, chunks);
    mergeAll(sorted);

timsort([5, 2, 8, 1, 9, 3, 7, 4, 6])
