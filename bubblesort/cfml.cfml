<cfscript>
function bubbleSort(arr) {
    var n = arrayLen(arr);
    var swapped = true;
    while (swapped) {
        swapped = false;
        for (var i = 1; i <= n - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                var tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        n--;
    }
    return arr;
}

arr = [64, 34, 25, 12, 22, 11, 90];
result = bubbleSort(arr);
writeOutput(arrayToList(result, " "));
</cfscript>
