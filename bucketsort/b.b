main() {
    auto arr[10], buckets[100], counts[10];
    auto n, i, j, idx, b, pos, key, minv, maxv, num;

    n = 10;
    arr[0] = 78; arr[1] = 17; arr[2] = 39; arr[3] = 26; arr[4] = 72;
    arr[5] = 94; arr[6] = 21; arr[7] = 12; arr[8] = 23; arr[9] = 68;

    minv = arr[0]; maxv = arr[0];
    i = 0;
    while (i < n) {
        if (arr[i] < minv) minv = arr[i];
        if (arr[i] > maxv) maxv = arr[i];
        i++;
    }

    i = 0;
    while (i < n) { counts[i] = 0; i++; }

    i = 0;
    while (i < n) {
        num = arr[i];
        idx = (num - minv) * n / (maxv - minv + 1);
        if (idx >= n) idx = n - 1;
        buckets[idx * n + counts[idx]] = num;
        counts[idx]++;
        i++;
    }

    pos = 0;
    b = 0;
    while (b < n) {
        i = 1;
        while (i < counts[b]) {
            key = buckets[b * n + i];
            j = i - 1;
            while (j >= 0 & buckets[b * n + j] > key) {
                buckets[b * n + j + 1] = buckets[b * n + j];
                j--;
            }
            buckets[b * n + j + 1] = key;
            i++;
        }
        i = 0;
        while (i < counts[b]) {
            arr[pos] = buckets[b * n + i];
            pos++;
            i++;
        }
        b++;
    }

    i = 0;
    while (i < n) {
        printf("%d ", arr[i]);
        i++;
    }
    printf("\n");
}
