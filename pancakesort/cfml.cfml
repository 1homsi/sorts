<cfscript>
function flip(required array arr, required numeric k) {
    var left = 1;
    var right = k + 1;
    while (left < right) {
        var tmp = arr[left];
        arr[left] = arr[right];
        arr[right] = tmp;
        left++;
        right--;
    }
    return arr;
}

function findMaxIdx(required array arr, required numeric sz) {
    var maxIdx = 1;
    for (var i = 2; i <= sz; i++) {
        if (arr[i] > arr[maxIdx]) maxIdx = i;
    }
    return maxIdx;
}

function pancakeSort(required array arr) {
    var sz = arrayLen(arr);
    while (sz > 1) {
        var mi = findMaxIdx(arr, sz);
        if (mi != sz) {
            if (mi != 1) arr = flip(arr, mi - 1);
            arr = flip(arr, sz - 1);
        }
        sz--;
    }
    return arr;
}

arr = [3, 6, 2, 7, 4, 1, 5];
writeOutput(arrayToList(pancakeSort(arr), " "));
</cfscript>
