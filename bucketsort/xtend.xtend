import java.util.ArrayList
import java.util.List

class BucketSort {
    def static insertionSort(List<Double> bucket) {
        val n = bucket.size
        for (i : 1..<n) {
            val key = bucket.get(i)
            var j = i - 1
            while (j >= 0 && bucket.get(j) > key) {
                bucket.set(j + 1, bucket.get(j))
                j--
            }
            bucket.set(j + 1, key)
        }
        bucket
    }

    def static bucketSort(List<Double> arr) {
        val n = arr.size
        if (n == 0) return arr
        val minV = arr.min[a, b | Double.compare(a, b)]
        val maxV = arr.max[a, b | Double.compare(a, b)]
        val buckets = new ArrayList<List<Double>>(n)
        for (i : 0..<n) buckets.add(new ArrayList<Double>)
        for (num : arr) {
            var idx = (int)((num - minV) / (maxV - minV + 1) * n)
            if (idx >= n) idx = n - 1
            buckets.get(idx).add(num)
        }
        val result = new ArrayList<Double>
        for (bucket : buckets) result.addAll(insertionSort(bucket))
        result
    }

    def static void main(String[] args) {
        val data = #[0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
        println(bucketSort(new ArrayList<Double>(data)))
    }
}
