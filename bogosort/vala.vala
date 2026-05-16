bool is_sorted (int[] arr) {
    for (int i = 0; i < arr.length - 1; i++) {
        if (arr[i] > arr[i + 1]) return false;
    }
    return true;
}

void shuffle (int[] arr) {
    int n = arr.length;
    for (int i = n - 1; i > 0; i--) {
        int j = Random.int_range (0, i + 1);
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

void bogosort (int[] arr) {
    while (!is_sorted (arr)) {
        shuffle (arr);
    }
}

void main () {
    int[] arr = {3, 1, 4, 1, 5, 9, 2, 6};
    bogosort (arr);
    foreach (int v in arr) stdout.printf ("%d ", v);
    stdout.printf ("\n");
}
