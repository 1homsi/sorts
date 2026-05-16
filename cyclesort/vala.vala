void cycle_sort(int[] arr) {
    int n = arr.length;
    int writes = 0;
    for (int cycle_start = 0; cycle_start < n - 1; cycle_start++) {
        int item = arr[cycle_start];
        int pos = cycle_start;
        for (int i = cycle_start + 1; i < n; i++) {
            if (arr[i] < item) pos++;
        }
        if (pos == cycle_start) continue;
        while (item == arr[pos]) pos++;
        int tmp = arr[pos]; arr[pos] = item; item = tmp;
        writes++;
        while (pos != cycle_start) {
            pos = cycle_start;
            for (int i = cycle_start + 1; i < n; i++) {
                if (arr[i] < item) pos++;
            }
            while (item == arr[pos]) pos++;
            tmp = arr[pos]; arr[pos] = item; item = tmp;
            writes++;
        }
    }
}

void main() {
    int[] arr = {5, 4, 3, 2, 1};
    cycle_sort(arr);
    foreach (int v in arr) stdout.printf("%d ", v);
    stdout.printf("\n");
}
