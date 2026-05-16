local newGap(gap) =
    local g = std.floor(gap / 1.3);
    if g < 1 then 1 else g;

local swap(arr, i, j) =
    [if k == i then arr[j]
     else if k == j then arr[i]
     else arr[k]
     for k in std.range(0, std.length(arr) - 1)];

local pass(arr, gap, i) =
    local n = std.length(arr);
    if i + gap >= n then arr
    else if arr[i] > arr[i + gap]
    then pass(swap(arr, i, i + gap), gap, i + 1)
    else pass(arr, gap, i + 1);

local sortLoop(arr, gap) =
    local g = newGap(gap);
    local arr2 = pass(arr, g, 0);
    if g == 1 then arr2
    else sortLoop(arr2, g);

local combSort(arr) = sortLoop(arr, std.length(arr));

combSort([5, 3, 8, 1, 9, 2, 7, 4, 6])
