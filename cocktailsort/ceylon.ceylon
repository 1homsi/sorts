shared void cocktailSort(Array<Integer> arr) {
    variable Boolean swapped = true;
    variable Integer start = 0;
    variable Integer ending = arr.size - 1;
    while (swapped) {
        swapped = false;
        variable Integer i = start;
        while (i < ending) {
            value a = arr[i];
            value b = arr[i + 1];
            if (exists a, exists b, a > b) {
                arr[i] = b;
                arr[i + 1] = a;
                swapped = true;
            }
            i++;
        }
        if (!swapped) { break; }
        swapped = false;
        ending--;
        i = ending - 1;
        while (i >= start) {
            value a = arr[i];
            value b = arr[i + 1];
            if (exists a, exists b, a > b) {
                arr[i] = b;
                arr[i + 1] = a;
                swapped = true;
            }
            i--;
        }
        start++;
    }
}
