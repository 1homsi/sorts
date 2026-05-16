local stoogeSort(arr, first, last) =
    local a = arr[first];
    local b = arr[last];
    local arr1 = if a > b then
        [if i == first then b else if i == last then a else arr[i]
         for i in std.range(0, std.length(arr)-1)]
    else arr;
    local n = last - first + 1;
    if n > 2 then
        local t = std.floor(n * 2 / 3);
        local arr2 = stoogeSort(arr1, first, first + t - 1);
        local arr3 = stoogeSort(arr2, last - t + 1, last);
        stoogeSort(arr3, first, first + t - 1)
    else arr1;

stoogeSort([3, 1, 4, 1, 5, 9, 2, 6], 0, 7)
