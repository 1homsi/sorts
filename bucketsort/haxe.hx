class BucketSort {
    static function insertionSort(bucket:Array<Float>):Array<Float> {
        var n = bucket.length;
        for (i in 1...n) {
            var key = bucket[i];
            var j = i - 1;
            while (j >= 0 && bucket[j] > key) {
                bucket[j + 1] = bucket[j];
                j--;
            }
            bucket[j + 1] = key;
        }
        return bucket;
    }

    static function bucketSort(arr:Array<Float>):Array<Float> {
        var n = arr.length;
        if (n == 0) return arr;
        var minV = arr[0], maxV = arr[0];
        for (v in arr) {
            if (v < minV) minV = v;
            if (v > maxV) maxV = v;
        }
        var buckets:Array<Array<Float>> = [for (i in 0...n) []];
        for (num in arr) {
            var idx = Math.floor((num - minV) / (maxV - minV + 1) * n);
            if (idx >= n) idx = n - 1;
            buckets[idx].push(num);
        }
        var result:Array<Float> = [];
        for (bucket in buckets) {
            for (v in insertionSort(bucket)) result.push(v);
        }
        return result;
    }

    static function main() {
        var data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
        trace(bucketSort(data));
    }
}
