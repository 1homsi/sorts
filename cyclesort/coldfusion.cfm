<cfscript>
function cycleSort(arr) {
    var writes = 0;
    var n = arrayLen(arr);
    for (var cycleStart = 1; cycleStart <= n - 1; cycleStart++) {
        var item = arr[cycleStart];
        var pos = cycleStart;
        for (var i = cycleStart + 1; i <= n; i++) {
            if (arr[i] < item) pos++;
        }
        if (pos == cycleStart) continue;
        while (item == arr[pos]) pos++;
        var tmp = arr[pos]; arr[pos] = item; item = tmp;
        writes++;
        while (pos != cycleStart) {
            pos = cycleStart;
            for (var i = cycleStart + 1; i <= n; i++) {
                if (arr[i] < item) pos++;
            }
            while (item == arr[pos]) pos++;
            tmp = arr[pos]; arr[pos] = item; item = tmp;
            writes++;
        }
    }
    return writes;
}

arr = [5, 4, 3, 2, 1];
cycleSort(arr);
writeOutput(arrayToList(arr, " "));
</cfscript>
