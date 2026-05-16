proc bubbleSort(ref arr: [] int) {
    var n = arr.size;
    var swapped = true;
    while swapped {
        swapped = false;
        for i in arr.domain.low..arr.domain.low+n-2 {
            if arr[i] > arr[i+1] {
                var tmp = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = tmp;
                swapped = true;
            }
        }
        n -= 1;
    }
}

var arr = [64, 34, 25, 12, 22, 11, 90];
bubbleSort(arr);
writeln(arr);
