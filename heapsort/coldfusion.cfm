<cfscript>
function heapify(arr, n, i) {
    var largest = i;
    var left = 2 * i + 1;
    var right = 2 * i + 2;
    if (left < n && arr[left+1] > arr[largest+1]) largest = left;
    if (right < n && arr[right+1] > arr[largest+1]) largest = right;
    if (largest != i) {
        var tmp = arr[i+1]; arr[i+1] = arr[largest+1]; arr[largest+1] = tmp;
        heapify(arr, n, largest);
    }
}

function heapsort(arr) {
    var n = arrayLen(arr);
    for (var i = int(n/2)-1; i >= 0; i--) heapify(arr, n, i);
    for (var i = n-1; i > 0; i--) {
        var tmp = arr[1]; arr[1] = arr[i+1]; arr[i+1] = tmp;
        heapify(arr, i, 0);
    }
    return arr;
}

arr = [12, 11, 13, 5, 6, 7];
result = heapsort(arr);
writeOutput(arrayToList(result, " "));
</cfscript>
