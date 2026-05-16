local insertSorted(x, lst) =
    if std.length(lst) == 0 then [x]
    else if x <= lst[0] then [x] + lst
    else [lst[0]] + insertSorted(x, lst[1:]);

local insertionSort(lst) =
    std.foldl(function(acc, x) insertSorted(x, acc), lst, []);

local getIdx(num, mn, mx, n) =
    local raw = std.floor((num - mn) / (mx - mn + 1) * n);
    std.min(n - 1, raw);

local bucketSort(arr) =
    local n = std.length(arr);
    if n == 0 then arr
    else
        local mn = std.foldl(function(a, b) if b < a then b else a, arr, arr[0]);
        local mx = std.foldl(function(a, b) if b > a then b else a, arr, arr[0]);
        local buckets = [
            [x for x in arr if getIdx(x, mn, mx, n) == i]
            for i in std.range(0, n - 1)
        ];
        std.flatMap(insertionSort, buckets);

bucketSort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68])
