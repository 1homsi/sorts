void cocktailsort(int[] arr) {
    int n = arr.length;
    int i = 0;
    while (i < n) {
        boolean swapped = false;
        for (int k = 0; k < n - i - 1; k++) {
            if (arr[k] > arr[k + 1]) {
                int temp = arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = true;
            }
        }
        if (!swapped) break;
        i++;
        swapped = false;
        for (int k = n - i - 2; k >= 0; k--) {
            if (arr[k] > arr[k + 1]) {
                int temp = arr[k];
                arr[k] = arr[k + 1];
                arr[k + 1] = temp;
                swapped = true;
            }
        }
        if (!swapped) break;
        i++;
    }
}

void setup() {
    int[] arr = {5, 2, 8, 1, 9, 3};
    cocktailsort(arr);
    println("Sorted: " + join(arr, " "));
}

void draw() {
}
