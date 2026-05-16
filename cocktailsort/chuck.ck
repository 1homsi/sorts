fun void cocktailsort(int arr[]) {
    int n;
    arr.size() => n;
    int i;
    0 => i;
    while (i < n) {
        0 => int swapped;
        for (int k = 0; k < n - i - 1; k++) {
            if (arr[k] > arr[k + 1]) {
                arr[k] => int temp;
                arr[k + 1] => arr[k];
                temp => arr[k + 1];
                1 => swapped;
            }
        }
        if (!swapped) break;
        (i + 1) => i;
        0 => swapped;
        for (int k = n - i - 2; k >= 0; k--) {
            if (arr[k] > arr[k + 1]) {
                arr[k] => int temp;
                arr[k + 1] => arr[k];
                temp => arr[k + 1];
                1 => swapped;
            }
        }
        if (!swapped) break;
        (i + 1) => i;
    }
}

int arr[6];
[5, 2, 8, 1, 9, 3] @=> arr;
cocktailsort(arr);
<<< "Sorted:", arr >>>;
