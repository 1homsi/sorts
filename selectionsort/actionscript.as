function selectionSort(arr:Array):Array {
    var n:int = arr.length;
    for (var i:int = 0; i < n; i++) {
        var minIdx:int = i;
        for (var j:int = i + 1; j < n; j++) {
            if (arr[j] < arr[minIdx]) minIdx = j;
        }
        var tmp:int = arr[i]; arr[i] = arr[minIdx]; arr[minIdx] = tmp;
    }
    return arr;
}
