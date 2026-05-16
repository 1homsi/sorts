var arr: [0..6] int = [3, 6, 2, 7, 4, 1, 5];

proc flip(ref arr: [] int, k: int) {
    var left = 0, right = k, tmp: int;
    while left < right {
        tmp = arr[left]; arr[left] = arr[right]; arr[right] = tmp;
        left += 1; right -= 1;
    }
}

proc findMaxIdx(arr: [] int, size: int): int {
    var maxIdx = 0;
    for i in 1..size-1 {
        if arr[i] > arr[maxIdx] then maxIdx = i;
    }
    return maxIdx;
}

proc pancakeSort(ref arr: [] int) {
    var size = arr.size;
    while size > 1 {
        var maxIdx = findMaxIdx(arr, size);
        if maxIdx != size - 1 {
            if maxIdx != 0 then flip(arr, maxIdx);
            flip(arr, size - 1);
        }
        size -= 1;
    }
}

pancakeSort(arr);
writeln(arr);
