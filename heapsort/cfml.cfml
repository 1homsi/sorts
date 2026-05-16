<cfscript>
function heapify(arr, n, i) {
    var largest = i;
    var left = 2 * i + 1;
    var right = 2 * i + 2;
    if (left LT n AND arr[left+1] GT arr[largest+1]) { largest = left; }
    if (right LT n AND arr[right+1] GT arr[largest+1]) { largest = right; }
    if (largest NEQ i) {
        var tmp = arr[i+1]; arr[i+1] = arr[largest+1]; arr[largest+1] = tmp;
        heapify(arr, n, largest);
    }
}

function heapsort(arr) {
    var n = arrayLen(arr);
    for (var i = INT(n/2)-1; i GTE 0; i--) { heapify(arr, n, i); }
    for (var i = n-1; i GT 0; i--) {
        var tmp = arr[1]; arr[1] = arr[i+1]; arr[i+1] = tmp;
        heapify(arr, i, 0);
    }
    return arr;
}

arr = [12, 11, 13, 5, 6, 7];
result = heapsort(arr);
writeOutput(arrayToList(result, " "));
</cfscript>
