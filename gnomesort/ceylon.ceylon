shared void gnomeSort(Array<Integer> arr) {
    variable Integer i = 0;
    Integer n = arr.size;
    while (i < n) {
        if (i == 0 || (arr[i] else 0) >= (arr[i - 1] else 0)) {
            i++;
        } else {
            Integer tmp = arr[i] else 0;
            arr.set(i, arr[i - 1] else 0);
            arr.set(i - 1, tmp);
            i--;
        }
    }
}
