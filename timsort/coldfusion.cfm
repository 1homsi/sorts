<cfscript>
variables.MIN_RUN = 32;

function insertionSort(arr, left, right) {
    var i = left + 1;
    while (i <= right) {
        var key = arr[i];
        var j = i - 1;
        while (j >= left && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
        i++;
    }
}

function mergeParts(arr, left, mid, right) {
    var lp = [];
    var rp = [];
    var x;
    for (x = left; x <= mid; x++) arrayAppend(lp, arr[x]);
    for (x = mid + 1; x <= right; x++) arrayAppend(rp, arr[x]);
    var i = 1; var j = 1; var k = left;
    var ln = arrayLen(lp); var rn = arrayLen(rp);
    while (i <= ln && j <= rn) {
        if (lp[i] <= rp[j]) { arr[k] = lp[i]; i++; }
        else { arr[k] = rp[j]; j++; }
        k++;
    }
    while (i <= ln) { arr[k] = lp[i]; i++; k++; }
    while (j <= rn) { arr[k] = rp[j]; j++; k++; }
}

function timsort(arr) {
    var n = arrayLen(arr);
    var i = 1;
    while (i <= n) {
        var right = min(i + MIN_RUN - 1, n);
        insertionSort(arr, i, right);
        i += MIN_RUN;
    }
    var size = MIN_RUN;
    while (size < n) {
        var left = 1;
        while (left <= n) {
            var mid = min(left + size - 1, n);
            var right = min(left + 2 * size - 1, n);
            if (mid < right) mergeParts(arr, left, mid, right);
            left += 2 * size;
        }
        size *= 2;
    }
}

var arr = [5, 2, 8, 1, 9, 3, 7, 4, 6];
timsort(arr);
writeOutput(arrayToList(arr, " "));
</cfscript>
