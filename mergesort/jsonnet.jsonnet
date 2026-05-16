local merge(left, right) =
    if std.length(left) == 0 then right
    else if std.length(right) == 0 then left
    else if left[0] <= right[0] then
        [left[0]] + merge(left[1:], right)
    else
        [right[0]] + merge(left, right[1:]);

local mergeSort(arr) =
    local n = std.length(arr);
    if n <= 1 then arr
    else
        local mid = std.floor(n / 2);
        local left = mergeSort(arr[0:mid]);
        local right = mergeSort(arr[mid:n]);
        merge(left, right);

mergeSort([38, 27, 43, 3, 9, 82, 10])
