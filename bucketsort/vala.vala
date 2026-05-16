using GLib;

void insertion_sort(double[] bucket, int n) {
    for (int i = 1; i < n; i++) {
        double key = bucket[i];
        int j = i - 1;
        while (j >= 0 && bucket[j] > key) {
            bucket[j + 1] = bucket[j];
            j--;
        }
        bucket[j + 1] = key;
    }
}

double[] bucket_sort(double[] arr) {
    int n = arr.length;
    if (n == 0) return arr;
    double min_v = arr[0], max_v = arr[0];
    for (int i = 0; i < n; i++) {
        if (arr[i] < min_v) min_v = arr[i];
        if (arr[i] > max_v) max_v = arr[i];
    }
    double[][] buckets = new double[n][];
    int[] counts = new int[n];
    for (int i = 0; i < n; i++) {
        buckets[i] = new double[n];
        counts[i] = 0;
    }
    for (int i = 0; i < n; i++) {
        int idx = (int)((arr[i] - min_v) / (max_v - min_v + 1) * n);
        if (idx >= n) idx = n - 1;
        buckets[idx][counts[idx]++] = arr[i];
    }
    double[] result = new double[n];
    int pos = 0;
    for (int b = 0; b < n; b++) {
        insertion_sort(buckets[b], counts[b]);
        for (int i = 0; i < counts[b]; i++) result[pos++] = buckets[b][i];
    }
    return result;
}

int main() {
    double[] data = {0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68};
    double[] sorted = bucket_sort(data);
    for (int i = 0; i < sorted.length; i++) print("%.2f ", sorted[i]);
    print("\n");
    return 0;
}
