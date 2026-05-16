use Sort;

proc countingSort(ref arr: [] int, exp: int) {
    const n = arr.size;
    var output: [0..<n] int;
    var count: [0..9] int = 0;
    for x in arr do count[(x / exp) % 10] += 1;
    for i in 1..9 do count[i] += count[i-1];
    for i in n-1..0 by -1 {
        const idx = (arr[i] / exp) % 10;
        count[idx] -= 1;
        output[count[idx]] = arr[i];
    }
    arr[0..<n] = output;
}

proc radixSort(ref arr: [] int) {
    if arr.size == 0 then return;
    var maxVal = max reduce arr;
    var exp = 1;
    while maxVal / exp > 0 {
        countingSort(arr, exp);
        exp *= 10;
    }
}

var arr = [170, 45, 75, 90, 802, 24, 2, 66];
radixSort(arr);
writeln(arr);
