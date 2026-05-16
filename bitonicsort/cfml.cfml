<cfscript>
function compareAndSwap(arr, i, j, dir) {
    var ai = arr[i];
    var aj = arr[j];
    if (dir == (ai > aj)) {
        arr[i] = aj;
        arr[j] = ai;
    }
    return arr;
}

function bitonicMerge(arr, lo, cnt, dir) {
    if (cnt > 1) {
        var k = int(cnt / 2);
        for (var i = lo; i < lo + k; i++) {
            arr = compareAndSwap(arr, i, i + k, dir);
        }
        arr = bitonicMerge(arr, lo, k, dir);
        arr = bitonicMerge(arr, lo + k, k, dir);
    }
    return arr;
}

function bitonicSort(arr, lo, cnt, dir) {
    if (cnt > 1) {
        var k = int(cnt / 2);
        arr = bitonicSort(arr, lo, k, true);
        arr = bitonicSort(arr, lo + k, k, false);
        arr = bitonicMerge(arr, lo, cnt, dir);
    }
    return arr;
}

data = [3, 7, 4, 8, 6, 2, 1, 5];
data = bitonicSort(data, 1, arrayLen(data), true);
writeOutput(arrayToList(data, " "));
</cfscript>
