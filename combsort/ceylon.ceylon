shared void combSort(Array<Integer> arr) {
    value n = arr.size;
    variable value gap = n;
    variable value sorted = false;
    while (!sorted) {
        gap = (gap.float / 1.3).integer;
        if (gap <= 1) {
            gap = 1;
            sorted = true;
        }
        for (i in 0 : n - gap) {
            value a = arr[i] else 0;
            value b = arr[i + gap] else 0;
            if (a > b) {
                arr.set(i, b);
                arr.set(i + gap, a);
                sorted = false;
            }
        }
    }
}
