<cfscript>
function countingSort(arr, exp) {
    var n = arrayLen(arr);
    var output = arrayNew(1);
    var count = arrayNew(1);
    for (var i = 1; i <= n; i++) output[i] = 0;
    for (var i = 1; i <= 10; i++) count[i] = 0;
    for (var i = 1; i <= n; i++) {
        var idx = (int(arr[i] / exp) mod 10) + 1;
        count[idx]++;
    }
    for (var i = 2; i <= 10; i++) {
        count[i] += count[i - 1];
    }
    for (var i = n; i >= 1; i--) {
        var idx = (int(arr[i] / exp) mod 10) + 1;
        count[idx]--;
        output[count[idx] + 1] = arr[i];
    }
    for (var i = 1; i <= n; i++) arr[i] = output[i];
    return arr;
}

function radixSort(arr) {
    if (arrayLen(arr) == 0) return arr;
    var maxVal = arr[1];
    for (var i = 2; i <= arrayLen(arr); i++) {
        if (arr[i] > maxVal) maxVal = arr[i];
    }
    var exp = 1;
    while (int(maxVal / exp) > 0) {
        arr = countingSort(arr, exp);
        exp *= 10;
    }
    return arr;
}

var arr = [170, 45, 75, 90, 802, 24, 2, 66];
var sorted = radixSort(arr);
writeOutput(arrayToList(sorted, ", "));
</cfscript>
