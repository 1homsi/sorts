cocktailsort(v, n) {
    auto swapped, start, end, i, tmp;
    swapped = 1;
    start = 0;
    end = n - 1;
    while (swapped) {
        swapped = 0;
        i = start;
        while (i < end) {
            if (v[i] > v[i+1]) {
                tmp = v[i];
                v[i] = v[i+1];
                v[i+1] = tmp;
                swapped = 1;
            }
            i =+ 1;
        }
        if (!swapped) return;
        swapped = 0;
        end =- 1;
        i = end - 1;
        while (i >= start) {
            if (v[i] > v[i+1]) {
                tmp = v[i];
                v[i] = v[i+1];
                v[i+1] = tmp;
                swapped = 1;
            }
            i =- 1;
        }
        start =+ 1;
    }
}
