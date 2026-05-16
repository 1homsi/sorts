void counting_sort(int[] arr, int exp) {
    int n = arr.length;
    int[] output = new int[n];
    int[] count = new int[10];
    for (int i = 0; i < 10; i++) count[i] = 0;
    for (int i = 0; i < n; i++) count[(arr[i] / exp) % 10]++;
    for (int i = 1; i < 10; i++) count[i] += count[i - 1];
    for (int i = n - 1; i >= 0; i--) {
        int idx = (arr[i] / exp) % 10;
        output[--count[idx]] = arr[i];
    }
    for (int i = 0; i < n; i++) arr[i] = output[i];
}

void radix_sort(int[] arr) {
    if (arr.length == 0) return;
    int max = arr[0];
    for (int i = 1; i < arr.length; i++) if (arr[i] > max) max = arr[i];
    for (int exp = 1; max / exp > 0; exp *= 10) counting_sort(arr, exp);
}

void main() {
    int[] arr = {170, 45, 75, 90, 802, 24, 2, 66};
    radix_sort(arr);
    foreach (int x in arr) stdout.printf("%d ", x);
    stdout.printf("\n");
}
