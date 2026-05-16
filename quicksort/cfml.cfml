<cfscript>
function partition(arr, low, high) {
    var pivot = arr[high];
    var i = low;
    for (var j = low; j < high; j++) {
        if (arr[j] <= pivot) {
            var tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
            i++;
        }
    }
    var tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp;
    return i;
}

function quicksort(arr, low, high) {
    if (low < high) {
        var p = partition(arr, low, high);
        quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high);
    }
}

var arr = [3, 6, 8, 10, 1, 2, 1];
quicksort(arr, 1, arrayLen(arr));
writeOutput(serializeJSON(arr));
</cfscript>
