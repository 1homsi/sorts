proc cycleSort(ref arr: [] int): int {
    var writes = 0;
    const n = arr.size;
    for cycleStart in 0..n-2 {
        var item = arr[cycleStart];
        var pos = cycleStart;
        for i in cycleStart+1..n-1 {
            if arr[i] < item then pos += 1;
        }
        if pos == cycleStart then continue;
        while item == arr[pos] do pos += 1;
        var tmp = arr[pos]; arr[pos] = item; item = tmp;
        writes += 1;
        while pos != cycleStart {
            pos = cycleStart;
            for i in cycleStart+1..n-1 {
                if arr[i] < item then pos += 1;
            }
            while item == arr[pos] do pos += 1;
            tmp = arr[pos]; arr[pos] = item; item = tmp;
            writes += 1;
        }
    }
    return writes;
}

var arr = [5, 4, 3, 2, 1];
cycleSort(arr);
writeln(arr);
