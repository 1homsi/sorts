<cfscript>
function selectionSort(arr) {
    var n = arrayLen(arr);
    for (var i = 1; i <= n - 1; i++) {
        var minIdx = i;
        for (var j = i + 1; j <= n; j++) {
            if (arr[j] < arr[minIdx]) minIdx = j;
        }
        var tmp = arr[i];
        arr[i] = arr[minIdx];
        arr[minIdx] = tmp;
    }
    return arr;
}
</cfscript>
