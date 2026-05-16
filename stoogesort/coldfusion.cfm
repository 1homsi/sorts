<cfscript>
function stoogeSort(arr, first, last) {
    if (arr[first+1] > arr[last+1]) {
        tmp = arr[first+1];
        arr[first+1] = arr[last+1];
        arr[last+1] = tmp;
    }
    n = last - first + 1;
    if (n > 2) {
        t = int(n * 2 / 3);
        stoogeSort(arr, first, first + t - 1);
        stoogeSort(arr, last - t + 1, last);
        stoogeSort(arr, first, first + t - 1);
    }
    return arr;
}

arr = [3, 1, 4, 1, 5, 9, 2, 6];
arr = stoogeSort(arr, 0, arrayLen(arr) - 1);
writeOutput(arrayToList(arr, " "));
</cfscript>
