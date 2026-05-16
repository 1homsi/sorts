import ceylon.collection { ArrayList }

shared void run() {
    value arr = ArrayList { 4, 2, 2, 8, 3, 3, 1 };
    value sorted = countingSort(arr);
    print(sorted);
}

shared ArrayList<Integer> countingSort(ArrayList<Integer> arr) {
    if (arr.empty) { return arr; }
    variable value minVal = arr.first else 0;
    variable value maxVal = arr.first else 0;
    for (v in arr) {
        if (v < minVal) { minVal = v; }
        if (v > maxVal) { maxVal = v; }
    }
    value range = maxVal - minVal + 1;
    value count = ArrayList { for (i in 0:range) 0 };
    for (v in arr) {
        value idx = v - minVal;
        count.set(idx, (count.get(idx) else 0) + 1);
    }
    for (i in 1:range-1) {
        count.set(i, (count.get(i) else 0) + (count.get(i-1) else 0));
    }
    value output = ArrayList { for (i in 0:arr.size) 0 };
    variable value i = arr.size - 1;
    while (i >= 0) {
        value v = arr.get(i) else 0;
        value idx = v - minVal;
        value pos = (count.get(idx) else 1) - 1;
        count.set(idx, pos);
        output.set(pos, v);
        i--;
    }
    return output;
}
