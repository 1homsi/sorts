proc cocktailSort(ref arr: [] int) {
    var swapped = true;
    var start = arr.domain.low;
    var end = arr.domain.high;
    while swapped {
        swapped = false;
        for i in start..end-1 {
            if arr[i] > arr[i + 1] {
                arr[i] <=> arr[i + 1];
                swapped = true;
            }
        }
        if !swapped then break;
        swapped = false;
        end -= 1;
        for i in start..end-1 by -1 {
            if arr[i] > arr[i + 1] {
                arr[i] <=> arr[i + 1];
                swapped = true;
            }
        }
        start += 1;
    }
}
