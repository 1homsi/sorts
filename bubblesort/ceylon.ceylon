shared void run() {
    value arr = Array { 64, 34, 25, 12, 22, 11, 90 };
    variable value n = arr.size;
    variable value swapped = true;
    while (swapped) {
        swapped = false;
        for (i in 0:n-1) {
            assert (exists xi = arr[i], exists xi1 = arr[i+1]);
            if (xi > xi1) {
                arr.set(i, xi1);
                arr.set(i+1, xi);
                swapped = true;
            }
        }
        n--;
    }
    print(arr);
}
