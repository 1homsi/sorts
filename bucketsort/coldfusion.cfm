<cfscript>
function insertionSort(bucket) {
    var n = arrayLen(bucket);
    for (var i = 2; i <= n; i++) {
        var key = bucket[i];
        var j = i - 1;
        while (j >= 1 && bucket[j] > key) {
            bucket[j + 1] = bucket[j];
            j--;
        }
        bucket[j + 1] = key;
    }
    return bucket;
}

function bucketSort(arr) {
    var n = arrayLen(arr);
    if (n == 0) return arr;
    var minV = arr[1];
    var maxV = arr[1];
    for (var v in arr) {
        if (v < minV) minV = v;
        if (v > maxV) maxV = v;
    }
    var buckets = [];
    for (var i = 1; i <= n; i++) {
        buckets[i] = [];
    }
    for (var num in arr) {
        var idx = int((num - minV) / (maxV - minV + 1) * n) + 1;
        if (idx > n) idx = n;
        arrayAppend(buckets[idx], num);
    }
    var result = [];
    for (var b in buckets) {
        var sorted = insertionSort(b);
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
