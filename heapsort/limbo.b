implement Heapsort;

include "sys.m";
include "draw.m";

sys: Sys;

heapsort(arr: array of int) {
    n := len(arr);
    for (i := n / 2 - 1; i >= 0; i--)
        siftdown(arr, i, n);
    for (i = n - 1; i > 0; i--) {
        temp := arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        siftdown(arr, 0, i);
    }
}

siftdown(arr: array of int, idx: int, n: int) {
    largest := idx;
    left := 2 * idx + 1;
    right := 2 * idx + 2;
    
    if (left < n && arr[left] > arr[largest])
        largest = left;
    if (right < n && arr[right] > arr[largest])
        largest = right;
    if (largest != idx) {
        temp := arr[idx];
        arr[idx] = arr[largest];
        arr[largest] = temp;
        siftdown(arr, largest, n);
    }
}

init() {
    arr := array[6] of int;
    arr[0] = 5; arr[1] = 2; arr[2] = 8; arr[3] = 1; arr[4] = 9; arr[5] = 3;
    heapsort(arr);
    sys->print("%d\n", arr);
}
