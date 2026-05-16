<cfscript>
function combSort(arr) {
    var n = arrayLen(arr);
    var gap = n;
    var sorted = false;
    while (!sorted) {
        gap = int(gap / 1.3);
        if (gap <= 1) {
            gap = 1;
            sorted = true;
        }
        for (var i = 1; i <= n - gap; i++) {
            if (arr[i] > arr[i + gap]) {
                var tmp = arr[i];
                arr[i] = arr[i + gap];
                arr[i + gap] = tmp;
                sorted = false;
            }
        }
    }
    return arr;
}
</cfscript>
