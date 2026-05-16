<cfscript>
function insertionSort(required array bucket) {
    var n = arrayLen(arguments.bucket);
    for (var i = 2; i <= n; i++) {
        var key = arguments.bucket[i];
        var j = i - 1;
        while (j >= 1 && arguments.bucket[j] > key) {
            arguments.bucket[j + 1] = arguments.bucket[j];
            j--;
        }
        arguments.bucket[j + 1] = key;
    }
    return arguments.bucket;
}

function bucketSort(required array arr) {
    var n = arrayLen(arguments.arr);
    if (n == 0) return arguments.arr;
    var minV = arguments.arr[1];
    var maxV = arguments.arr[1];
    for (var i = 1; i <= n; i++) {
        if (arguments.arr[i] < minV) minV = arguments.arr[i];
        if (arguments.arr[i] > maxV) maxV = arguments.arr[i];
    }
    var buckets = arrayNew(1);
    for (var i = 1; i <= n; i++) {
        buckets[i] = arrayNew(1);
    }
    for (var i = 1; i <= n; i++) {
        var num = arguments.arr[i];
        var idx = int((num - minV) / (maxV - minV + 1) * n) + 1;
        if (idx > n) idx = n;
        arrayAppend(buckets[idx], num);
    }
    var result = arrayNew(1);
    for (var i = 1; i <= n; i++) {
        var sorted = insertionSort(buckets[i]);
        for (var v in sorted) {
            arrayAppend(result, v);
        }
    }
    return result;
}

var data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
var sorted = bucketSort(data);
writeOutput(arrayToList(sorted, ", "));
</cfscript>
