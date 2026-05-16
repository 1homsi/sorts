import ceylon.collection { ArrayList }

void stoogeSort(ArrayList<Integer> arr, Integer first, Integer last) {
    if ((arr.get(first) else 0) > (arr.get(last) else 0)) {
        value tmp = arr.get(first);
        arr.set(first, arr.get(last) else 0);
        arr.set(last, tmp else 0);
    }
    if (last - first + 1 > 2) {
        value t = (last - first + 1) * 2 / 3;
        stoogeSort(arr, first, first + t - 1);
        stoogeSort(arr, last - t + 1, last);
        stoogeSort(arr, first, first + t - 1);
    }
}

void run() {
    value arr = ArrayList { 3, 1, 4, 1, 5, 9, 2, 6 };
    stoogeSort(arr, 0, arr.size - 1);
    print(arr);
}
