function insertionSort(arr:Array):Array {
    var n:int = arr.length;
    for (var i:int = 1; i < n; i++) {
        var key:int = arr[i];
        var j:int = i - 1;
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
    return arr;
}
