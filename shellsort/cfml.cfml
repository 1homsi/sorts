<cfscript>
function shellSort(arr) {
    var n = arrayLen(arr);
    var gap = int(n / 2);
    while (gap > 0) {
        for (var i = gap + 1; i <= n; i++) {
            var temp = arr[i];
            var j = i;
            while (j > gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap = int(gap / 2);
    }
    return arr;
}

arr = [64, 34, 25, 12, 22, 11, 90];
sorted = shellSort(arr);
writeOutput(arrayToList(sorted, " "));
</cfscript>
