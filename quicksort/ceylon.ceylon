shared void run() {
    value arr = arrayOfSize(7, 0);
    arr.set(0, 3); arr.set(1, 6); arr.set(2, 8); arr.set(3, 10);
    arr.set(4, 1); arr.set(5, 2); arr.set(6, 1);
    quicksort(arr, 0, arr.size - 1);
    print(arr);
}

Integer partition(Array<Integer> arr, Integer low, Integer high) {
    value pivot = arr[high] else 0;
    variable Integer i = low;
    variable Integer j = low;
    while (j < high) {
        value v = arr[j] else 0;
        if (v <= pivot) {
            value tmp = arr[i] else 0;
            arr.set(i, v);
            arr.set(j, tmp);
            i++;
        }
        j++;
    }
    value tmp = arr[i] else 0;
    arr.set(i, pivot);
    arr.set(high, tmp);
    return i;
}

void quicksort(Array<Integer> arr, Integer low, Integer high) {
    if (low < high) {
        value p = partition(arr, low, high);
        quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high);
    }
}
