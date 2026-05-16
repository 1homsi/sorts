class InsertionSort {
    public static function sort(arr: Array<Int>): Array<Int> {
        var n = arr.length;
        for (i in 1...n) {
            var key = arr[i];
            var j = i - 1;
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
        return arr;
    }
}
