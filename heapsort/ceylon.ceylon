shared void run() {
    value arr = Array<Integer> { 12, 11, 13, 5, 6, 7 };
    heapsort(arr);
    print(arr);
}

void heapify(Array<Integer> arr, Integer n, Integer i) {
    variable Integer largest = i;
    Integer left = 2 * i + 1;
    Integer right = 2 * i + 2;
    if (left < n, exists al = arr[left], exists al2 = arr[largest], al > al2) { largest = left; }
    if (right < n, exists ar = arr[right], exists al3 = arr[largest], ar > al3) { largest = right; }
    if (largest != i) {
        assert(exists vi = arr[i], exists vl = arr[largest]);
        arr.set(i, vl); arr.set(largest, vi);
        heapify(arr, n, largest);
    }
}

void heapsort(Array<Integer> arr) {
    Integer n = arr.size;
    variable Integer i = n / 2 - 1;
    while (i >= 0) { heapify(arr, n, i); i--; }
    i = n - 1;
    while (i > 0) {
        assert(exists v0 = arr[0], exists vi = arr[i]);
        arr.set(0, vi); arr.set(i, v0);
        heapify(arr, i, 0);
        i--;
    }
}
