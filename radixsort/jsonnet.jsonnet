local getDigit(x, exp) = std.floor(x / exp) % 10;

local countingSort(arr, exp) =
    std.flatMap(
        function(d) std.filter(function(x) getDigit(x, exp) == d, arr),
        std.range(0, 9)
    );

local radixSortLoop(arr, maxVal, exp) =
    if std.floor(maxVal / exp) == 0 then arr
    else radixSortLoop(countingSort(arr, exp), maxVal, exp * 10);

local radixSort(arr) =
    if std.length(arr) == 0 then arr
    else
        local maxVal = std.foldl(function(acc, x) if x > acc then x else acc, arr, 0);
        radixSortLoop(arr, maxVal, 1);

radixSort([170, 45, 75, 90, 802, 24, 2, 66])
