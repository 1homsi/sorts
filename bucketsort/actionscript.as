package {
    import flash.display.Sprite;

    public class BucketSort extends Sprite {
        private function insertionSort(bucket:Array):Array {
            var n:int = bucket.length;
            for (var i:int = 1; i < n; i++) {
                var key:Number = bucket[i];
                var j:int = i - 1;
                while (j >= 0 && bucket[j] > key) {
                    bucket[j + 1] = bucket[j];
                    j--;
                }
                bucket[j + 1] = key;
            }
            return bucket;
        }

        private function bucketSort(arr:Array):Array {
            var n:int = arr.length;
            if (n == 0) return arr;
            var minV:Number = arr[0], maxV:Number = arr[0];
            for each (var v:Number in arr) {
                if (v < minV) minV = v;
                if (v > maxV) maxV = v;
            }
            var buckets:Array = [];
            for (var i:int = 0; i < n; i++) buckets.push([]);
            for each (var num:Number in arr) {
                var idx:int = int((num - minV) / (maxV - minV + 1) * n);
                if (idx >= n) idx = n - 1;
                buckets[idx].push(num);
            }
            var result:Array = [];
            for each (var bucket:Array in buckets) {
                result = result.concat(insertionSort(bucket));
            }
            return result;
        }

        public function BucketSort() {
            var data:Array = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
            trace(bucketSort(data));
        }
    }
}
