<cfscript>
function gnomeSort(arr) {
    var i = 1;
    var n = arrayLen(arr);
    while (i <= n) {
        if (i == 1 || arr[i] >= arr[i - 1]) {
            i++;
        } else {
            var tmp = arr[i];
            arr[i] = arr[i - 1];
            arr[i - 1] = tmp;
            i--;
        }
    }
    return arr;
}
</cfscript>
