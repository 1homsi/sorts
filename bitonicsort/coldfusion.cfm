<cfscript>
function compareAndSwap(arr, i, j, direction) {
    var ai = arr[i];
    var aj = arr[j];
    if (direction == (ai > aj)) {
        arr[i] = aj;
        arr[j] = ai;
    }
    return arr;
}

function bitonicMerge(arr, lo, cnt, direction) {
    if (cnt > 1) {
        var k = int(cnt / 2);
        for (var i = lo; i < lo + k; i++) {
            arr = compareAndSwap(arr, i, i + k, direction);
        }
        arr = bitonicMerge(arr, lo, k, direction);
        arr = bitonicMerge(arr, lo + k, k, direction);
    }
    return arr;
}

function bitonicSort(arr, lo, cnt, direction) {
    if (cnt > 1) {
        var k = int(cnt / 2);
        arr = bitonicSort(arr, lo, k, true);
        arr = bitonicSort(arr, lo + k, k, false);
        arr = bitonicMerge(arr, lo, cnt, direction);
    }
    return arr;
}

var data = [3, 7, 4, 8, 6, 2, 1, 5];
data = bitonicSort(data, 1, arrayLen(data), true);
writeOutput(arrayToList(data, " "));
</cfscript>
