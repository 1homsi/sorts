<cfscript>
function isSorted(arr) {
    for (var i = 1; i <= arrayLen(arr) - 1; i++) {
        if (arr[i] > arr[i + 1]) return false;
    }
    return true;
}

function shuffleArr(arr) {
    var n = arrayLen(arr);
    for (var i = n; i > 1; i--) {
        var j = randRange(1, i);
        var tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
    return arr;
}

function bogosort(arr) {
    while (!isSorted(arr)) {
        arr = shuffleArr(arr);
    }
    return arr;
}

arr = [3, 1, 4, 1, 5, 9, 2, 6];
sorted = bogosort(arr);
writeOutput(arrayToList(sorted, ", "));
</cfscript>
