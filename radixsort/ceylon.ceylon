import ceylon.collection { ArrayList }

void countingSort(ArrayList<Integer> arr, Integer exp) {
    value n = arr.size;
    value output = ArrayList<Integer> { elements = (0:n).map((_) => 0); };
    value count = ArrayList<Integer> { elements = (0:10).map((_) => 0); };
    for (x in arr) {
        value idx = (x / exp) % 10;
        count.set(idx, (count[idx] else 0) + 1);
    }
    for (i in 1:9) {
        count.set(i, (count[i] else 0) + (count[i-1] else 0));
    }
    for (i in (n-1)..(0)) {
        value x = arr[i] else 0;
        value idx = (x / exp) % 10;
        value pos = (count[idx] else 1) - 1;
        count.set(idx, pos);
        output.set(pos, x);
    }
    for (i in 0:n) { arr.set(i, output[i] else 0); }
}

shared void run() {
    value arr = ArrayList<Integer> { elements = {170, 45, 75, 90, 802, 24, 2, 66}; };
    variable value maxVal = arr[0] else 0;
    for (x in arr) { if (x > maxVal) { maxVal = x; } }
    variable value exp = 1;
    while (maxVal / exp > 0) {
        countingSort(arr, exp);
        exp *= 10;
    }
    print(arr);
}
