void counting_sort(int[] arr) {
    int n = arr.length;
    if (n == 0) return;
    int min = arr[0], max = arr[0];
    foreach (int v in arr) {
        if (v < min) min = v;
        if (v > max) max = v;
    }
    int range = max - min + 1;
    int[] count = new int[range];
    int[] output = new int[n];
    foreach (int v in arr) count[v - min]++;
    for (int i = 1; i < range; i++) count[i] += count[i - 1];
    for (int i = n - 1; i >= 0; i--) output[--count[arr[i] - min]] = arr[i];
    for (int i = 0; i < n; i++) arr[i] = output[i];
}
void main() {
    int[] arr = {4, 2, 2, 8, 3, 3, 1};
    counting_sort(arr);
    foreach (int v in arr) stdout.printf("%d ", v);
    stdout.printf("
");
}
