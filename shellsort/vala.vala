void shell_sort(int[] arr) {
    int n = arr.length;
    for (int gap = n / 2; gap > 0; gap /= 2) {
        for (int i = gap; i < n; i++) {
            int temp = arr[i];
            int j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
    }
}

void main() {
    int[] arr = {64, 34, 25, 12, 22, 11, 90};
    shell_sort(arr);
    foreach (int v in arr) stdout.printf("%d ", v);
    stdout.printf("\n");
}
