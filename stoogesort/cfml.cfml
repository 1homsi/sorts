<cfscript>
function stoogeSort(required array arr, required numeric first, required numeric last) {
    if (arguments.arr[arguments.first+1] > arguments.arr[arguments.last+1]) {
        local.tmp = arguments.arr[arguments.first+1];
        arguments.arr[arguments.first+1] = arguments.arr[arguments.last+1];
        arguments.arr[arguments.last+1] = local.tmp;
    }
    local.n = arguments.last - arguments.first + 1;
    if (local.n > 2) {
        local.t = int(local.n * 2 / 3);
        stoogeSort(arguments.arr, arguments.first, arguments.first + local.t - 1);
        stoogeSort(arguments.arr, arguments.last - local.t + 1, arguments.last);
        stoogeSort(arguments.arr, arguments.first, arguments.first + local.t - 1);
    }
    return arguments.arr;
}

local.arr = [3, 1, 4, 1, 5, 9, 2, 6];
local.arr = stoogeSort(local.arr, 0, arrayLen(local.arr) - 1);
writeOutput(arrayToList(local.arr, " "));
</cfscript>
