using System;
using System.Collections.Generic;

class BucketSort {
    static void InsertionSort(List<double> bucket) {
        for (int i = 1; i < bucket.Count; i++) {
            double key = bucket[i];
            int j = i - 1;
            while (j >= 0 && bucket[j] > key) {
                bucket[j + 1] = bucket[j];
                j--;
            }
            bucket[j + 1] = key;
        }
    }

    static double[] Sort(double[] arr) {
        int n = arr.Length;
        if (n == 0) return arr;
        double min = double.MaxValue, max = double.MinValue;
        foreach (var v in arr) {
            if (v < min) min = v;
            if (v > max) max = v;
        }
        var buckets = new List<double>[n];
        for (int i = 0; i < n; i++) buckets[i] = new List<double>();
        foreach (var num in arr) {
            int idx = (int)((num - min) / (max - min + 1) * n);
            if (idx >= n) idx = n - 1;
            buckets[idx].Add(num);
        }
        int pos = 0;
        double[] result = new double[n];
        foreach (var bucket in buckets) {
            InsertionSort(bucket);
            foreach (var val in bucket) result[pos++] = val;
        }
        return result;
    }

    static void Main() {
        double[] data = {0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68};
        Console.WriteLine(string.Join(", ", Sort(data)));
    }
}
