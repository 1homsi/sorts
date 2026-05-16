import x10.util.ArrayList;
import x10.io.Console;

public class BucketSort {
    static def insertionSort(bucket: ArrayList[Double]) {
        val n = bucket.size();
        for (var i: Int = 1n; i < n; i++) {
            val key = bucket(i);
            var j: Int = i - 1n;
            while (j >= 0n && bucket(j) > key) {
                bucket(j + 1n) = bucket(j);
                j--;
            }
            bucket(j + 1n) = key;
        }
    }

    static def bucketSort(arr: ArrayList[Double]): ArrayList[Double] {
        val n = arr.size();
        if (n == 0n) return arr;
        var minV: Double = arr(0n);
        var maxV: Double = arr(0n);
        for (v in arr) {
            if (v < minV) minV = v;
            if (v > maxV) maxV = v;
        }
        val buckets = new ArrayList[ArrayList[Double]](n);
        for (var i: Int = 0n; i < n; i++) buckets.add(new ArrayList[Double]());
        for (num in arr) {
            var idx: Int = ((num - minV) / (maxV - minV + 1.0) * n) as Int;
            if (idx >= n) idx = n - 1n;
            buckets(idx).add(num);
        }
        val result = new ArrayList[Double]();
        for (bucket in buckets) {
            insertionSort(bucket);
            for (v in bucket) result.add(v);
        }
        return result;
    }

    public static def main(args: Rail[String]) {
        val data = new ArrayList[Double]();
        for (v in [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]) data.add(v);
        Console.OUT.println(bucketSort(data));
    }
}
