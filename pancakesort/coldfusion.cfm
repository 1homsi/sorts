<cfscript>
function flip(arr, k) {
    var left = 1;
    var right = k + 1;
    var tmp = 0;
    while (left < right) {
        tmp = arr[left];
        arr[left] = arr[right];
        arr[right] = tmp;
        left++;
        right--;
    }
    return arr;
}

function findMaxIdx(arr, size) {
    var maxIdx = 1;
    for (var i = 2; i <= size; i++) {
        if (arr[i] > arr[maxIdx]) maxIdx = i;
    }
    return maxIdx;
}

function pancakeSort(arr) {
    var size = arrayLen(arr);
    while (size > 1) {
        var maxIdx = findMaxIdx(arr, size);
        if (maxIdx != size) {
            if (maxIdx != 1) arr = flip(arr, maxIdx - 1);
            arr = flip(arr, size - 1);
        }
        size--;
    }
    return arr;
}

arr = [3, 6, 2, 7, 4, 1, 5];
result = pancakeSort(arr);
writeOutput(arrayToList(result, ", "));
</cfscript>
