<cfscript>
function merge(left, right) {
    var result = [];
    var i = 1; var j = 1;
    while (i <= arrayLen(left) && j <= arrayLen(right)) {
        if (left[i] <= right[j]) {
            arrayAppend(result, left[i]); i++;
        } else {
            arrayAppend(result, right[j]); j++;
        }
    }
    while (i <= arrayLen(left)) { arrayAppend(result, left[i]); i++; }
    while (j <= arrayLen(right)) { arrayAppend(result, right[j]); j++; }
    return result;
}

function mergeSort(arr) {
    var n = arrayLen(arr);
    if (n <= 1) return arr;
    var mid = int(n / 2);
    var left = mergeSort(arr[1..mid]);
    var right = mergeSort(arr[mid+1..n]);
    return merge(left, right);
}

var arr = [38, 27, 43, 3, 9, 82, 10];
var sorted = mergeSort(arr);
writeOutput(arrayToList(sorted, " "));
</cfscript>
