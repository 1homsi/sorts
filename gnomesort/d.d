void gnomeSort(int[] arr) {
    int i = 0;
    while (i < arr.length) {
        if (i == 0 || arr[i] >= arr[i - 1]) {
            i++;
        } else {
            import std.algorithm : swap;
            swap(arr[i], arr[i - 1]);
            i--;
        }
    }
}
