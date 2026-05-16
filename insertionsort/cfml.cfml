<cfscript>
function insertionSort(required array arr) {
    var n = arrayLen(arr);
    for (var i = 2; i <= n; i++) {
        var key = arr[i];
        var j = i - 1;
        while (j >= 1 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
    return arr;
}
</cfscript>
