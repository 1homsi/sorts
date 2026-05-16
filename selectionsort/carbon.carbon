package SelectionSort api;

fn SelectionSort(arr: [i32]) -> [i32] {
    var n: i32 = arr.size();
    var result: [i32] = arr;
    var i: i32 = 0;
    while (i < n) {
        var min_idx: i32 = i;
        var j: i32 = i + 1;
        while (j < n) {
            if (result[j] < result[min_idx]) {
                min_idx = j;
            }
            j = j + 1;
        }
        var tmp: i32 = result[i];
        result[i] = result[min_idx];
        result[min_idx] = tmp;
        i = i + 1;
    }
    return result;
}
