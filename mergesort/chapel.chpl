proc merge(left: [] int, right: [] int): [] int {
    var result: [0..left.size + right.size - 1] int;
    var i = 0, j = 0, k = 0;
    while i < left.size && j < right.size {
        if left[i] <= right[j] { result[k] = left[i]; i += 1; }
        else { result[k] = right[j]; j += 1; }
        k += 1;
    }
    while i < left.size { result[k] = left[i]; i += 1; k += 1; }
    while j < right.size { result[k] = right[j]; j += 1; k += 1; }
    return result;
}

proc mergeSort(arr: [] int): [] int {
    if arr.size <= 1 then return arr;
    var mid = arr.size / 2;
    var left = mergeSort(arr[0..mid-1]);
    var right = mergeSort(arr[mid..arr.size-1]);
    return merge(left, right);
}

var arr: [0..6] int = [38, 27, 43, 3, 9, 82, 10];
writeln(mergeSort(arr));
