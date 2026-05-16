<cfscript>
function partition(arr, low, high) {
    var pivot = arr[high];
    var i = low;
    var tmp = 0;
    for (var j = low; j < high; j++) {
        if (arr[j] <= pivot) {
            tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
            i++;
        }
    }
    tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp;
    return i;
}

function quicksort(arr, low, high) {
    if (low < high) {
        var p = partition(arr, low, high);
        quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high);
    }
}

arr = [3, 6, 8, 10, 1, 2, 1];
quicksort(arr, 1, arrayLen(arr));
writeOutput(arrayToList(arr, " "));
</cfscript>
