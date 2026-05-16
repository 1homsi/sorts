import std.stdio;
import std.algorithm;
import std.array;

void insertionSort(ref double[] bucket) {
    for (int i = 1; i < bucket.length; i++) {
        double key = bucket[i];
        int j = i - 1;
        while (j >= 0 && bucket[j] > key) {
            bucket[j + 1] = bucket[j];
            j--;
        }
        bucket[j + 1] = key;
    }
}

double[] bucketSort(double[] arr) {
    int n = cast(int)arr.length;
    if (n == 0) return arr;
    double minV = arr.minElement;
    double maxV = arr.maxElement;
    double[][] buckets = new double[][](n);
    foreach (num; arr) {
        int idx = cast(int)((num - minV) / (maxV - minV + 1) * n);
        if (idx >= n) idx = n - 1;
        buckets[idx] ~= num;
    }
    double[] result;
    foreach (ref bucket; buckets) {
        insertionSort(bucket);
        result ~= bucket;
    }
    return result;
}

void main() {
    auto data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
    writeln(bucketSort(data));
}
