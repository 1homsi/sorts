import java.util.*;

public class java {
    static void insertionSort(List<Double> bucket) {
        for (int i = 1; i < bucket.size(); i++) {
            double key = bucket.get(i);
            int j = i - 1;
            while (j >= 0 && bucket.get(j) > key) {
                bucket.set(j + 1, bucket.get(j));
                j--;
            }
            bucket.set(j + 1, key);
        }
    }

    static double[] bucketSort(double[] arr) {
        int n = arr.length;
        if (n == 0) return arr;
        double min = arr[0], max = arr[0];
        for (double v : arr) {
            if (v < min) min = v;
            if (v > max) max = v;
        }
        List<List<Double>> buckets = new ArrayList<>();
        for (int i = 0; i < n; i++) buckets.add(new ArrayList<>());
        for (double num : arr) {
            int idx = (int) ((num - min) / (max - min + 1) * n);
            if (idx >= n) idx = n - 1;
            buckets.get(idx).add(num);
        }
        int i = 0;
        double[] result = new double[n];
        for (List<Double> bucket : buckets) {
            insertionSort(bucket);
            for (double val : bucket) result[i++] = val;
        }
        return result;
    }

    public static void main(String[] args) {
        double[] data = {0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68};
        System.out.println(Arrays.toString(bucketSort(data)));
    }
}
