use Random;

proc isSorted(arr: [] int): bool {
    for i in arr.domain.low..arr.domain.high - 1 {
        if arr[i] > arr[i + 1] then return false;
    }
    return true;
}

proc shuffle(ref arr: [] int) {
    var rng = new randomStream(real);
    var n = arr.size;
    for i in 1..n - 1 by -1 {
        var j = (rng.next() * (i + 1)): int + 1;
        arr[i] <=> arr[j];
    }
}

proc bogosort(ref arr: [] int) {
    while !isSorted(arr) do shuffle(arr);
}

var arr: [1..8] int = [3, 1, 4, 1, 5, 9, 2, 6];
bogosort(arr);
writeln(arr);
