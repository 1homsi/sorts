import ceylon.language { Integer, print }

shared void shellSort(Array<Integer> arr) {
    value n = arr.size;
    variable value gap = n / 2;
    while (gap > 0) {
        for (i in gap:n-gap) {
            value temp = arr[i] else 0;
            variable value j = i;
            while (j >= gap && (arr[j-gap] else 0) > temp) {
                arr.set(j, arr[j-gap] else 0);
                j -= gap;
            }
            arr.set(j, temp);
        }
        gap /= 2;
    }
}

shared void run() {
    value arr = Array<Integer> { 64, 34, 25, 12, 22, 11, 90 };
    shellSort(arr);
    print(arr);
}
