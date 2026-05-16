shared void run() {
    value arr = Array { 3, 6, 2, 7, 4, 1, 5 };

    void flip(Array<Integer> a, Integer k) {
        variable Integer left = 0;
        variable Integer right = k;
        while (left < right) {
            value tmp = a[left] else 0;
            a.set(left, a[right] else 0);
            a.set(right, tmp);
            left++;
            right--;
        }
    }

    variable Integer size = arr.size;
    while (size > 1) {
        variable Integer maxIdx = 0;
        for (i in 1..size-1) {
            if ((arr[i] else 0) > (arr[maxIdx] else 0)) {
                maxIdx = i;
            }
        }
        if (maxIdx != size - 1) {
            if (maxIdx != 0) { flip(arr, maxIdx); }
            flip(arr, size - 1);
        }
        size--;
    }

    print(arr);
}
