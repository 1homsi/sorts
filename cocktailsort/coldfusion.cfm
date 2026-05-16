<cfscript>
function cocktailSort(arr) {
    var swapped = true;
    var start = 1;
    var ending = arrayLen(arr);
    var tmp = 0;
    while (swapped) {
        swapped = false;
        for (var i = start; i < ending; i++) {
            if (arr[i] > arr[i + 1]) {
                tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        if (!swapped) break;
        swapped = false;
        ending--;
        for (var i = ending - 1; i >= start; i--) {
            if (arr[i] > arr[i + 1]) {
                tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        start++;
    }
    return arr;
}
</cfscript>
