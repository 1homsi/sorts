import ceylon.collection { ArrayList }

Integer minRun = 32;

void insertionSort(ArrayList<Integer> arr, Integer left, Integer right) {
    variable Integer i = left + 1;
    while (i <= right) {
        Integer key = arr[i] else 0;
        variable Integer j = i - 1;
        while (j >= left && (arr[j] else 0) > key) {
            arr.set(j + 1, arr[j] else 0);
            j--;
        }
        arr.set(j + 1, key);
        i++;
    }
}

void mergeRuns(ArrayList<Integer> arr, Integer left, Integer mid, Integer right) {
    value lp = ArrayList<Integer>();
    value rp = ArrayList<Integer>();
    variable Integer k = left;
    while (k <= mid) { lp.add(arr[k] else 0); k++; }
    k = mid + 1;
    while (k <= right) { rp.add(arr[k] else 0); k++; }
    variable Integer i = 0; variable Integer j = 0; k = left;
    while (i < lp.size && j < rp.size) {
        if ((lp[i] else 0) <= (rp[j] else 0)) {
            arr.set(k, lp[i] else 0); i++;
        } else {
            arr.set(k, rp[j] else 0); j++;
        }
        k++;
    }
    while (i < lp.size) { arr.set(k, lp[i] else 0); i++; k++; }
    while (j < rp.size) { arr.set(k, rp[j] else 0); j++; k++; }
}

void timsort(ArrayList<Integer> arr) {
    Integer n = arr.size;
    variable Integer i = 0;
    while (i < n) {
        insertionSort(arr, i, smallest(i + minRun - 1, n - 1));
        i += minRun;
    }
    variable Integer size = minRun;
    while (size < n) {
        variable Integer left = 0;
        while (left < n) {
            Integer mid = smallest(left + size - 1, n - 1);
            Integer right = smallest(left + 2 * size - 1, n - 1);
            if (mid < right) { mergeRuns(arr, left, mid, right); }
            left += 2 * size;
        }
        size *= 2;
    }
}

shared void run() {
    value arr = ArrayList<Integer> { 5, 2, 8, 1, 9, 3, 7, 4, 6 };
    timsort(arr);
    print(arr);
}
