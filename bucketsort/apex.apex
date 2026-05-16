public class BucketSort {
    public static List<Decimal> insertionSort(List<Decimal> bucket) {
        Integer n = bucket.size();
        for (Integer i = 1; i < n; i++) {
            Decimal key = bucket[i];
            Integer j = i - 1;
            while (j >= 0 && bucket[j] > key) {
                bucket[j + 1] = bucket[j];
                j--;
            }
            bucket[j + 1] = key;
        }
        return bucket;
    }

    public static List<Decimal> bucketSort(List<Decimal> arr) {
        Integer n = arr.size();
        if (n == 0) return arr;
        Decimal minV = arr[0], maxV = arr[0];
        for (Decimal v : arr) {
            if (v < minV) minV = v;
            if (v > maxV) maxV = v;
        }
        List<List<Decimal>> buckets = new List<List<Decimal>>();
        for (Integer i = 0; i < n; i++) buckets.add(new List<Decimal>());
        for (Decimal num : arr) {
            Integer idx = (Integer)((num - minV) / (maxV - minV + 1) * n);
            if (idx >= n) idx = n - 1;
            buckets[idx].add(num);
        }
        List<Decimal> result = new List<Decimal>();
        for (List<Decimal> bucket : buckets) {
            result.addAll(insertionSort(bucket));
        }
        return result;
    }

    public static void main() {
        List<Decimal> data = new List<Decimal>{0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68};
        System.debug(bucketSort(data));
    }
}
