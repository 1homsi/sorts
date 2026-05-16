<cfscript>
function countingSort(arr, exp) {
    var n = arr.len();
    var output = [];
    var count = [];
    for (var i = 1; i <= n; i++) output.append(0);
    for (var i = 1; i <= 10; i++) count.append(0);
    for (var x in arr) {
        var idx = (int(x / exp) mod 10) + 1;
        count[idx]++;
    }
    for (var i = 2; i <= 10; i++) count[i] += count[i-1];
    for (var i = n; i >= 1; i--) {
        var idx = (int(arr[i] / exp) mod 10) + 1;
        count[idx]--;
        output[count[idx] + 1] = arr[i];
    }
    for (var i = 1; i <= n; i++) arr[i] = output[i];
    return arr;
}

function radixSort(arr) {
    if (!arr.len()) return arr;
    var maxVal = arr.max();
    var exp = 1;
    while (int(maxVal / exp) > 0) {
        arr = countingSort(arr, exp);
        exp *= 10;
    }
    return arr;
}

var arr = [170, 45, 75, 90, 802, 24, 2, 66];
writeDump(radixSort(arr));
</cfscript>
