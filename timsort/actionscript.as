package {
    public class TimSort {
        private static const MIN_RUN:int = 32;

        private static function insertionSort(arr:Array, left:int, right:int):void {
            for (var i:int = left + 1; i <= right; i++) {
                var key:int = arr[i];
                var j:int = i - 1;
                while (j >= left && arr[j] > key) {
                    arr[j + 1] = arr[j];
                    j--;
                }
                arr[j + 1] = key;
            }
        }

        private static function merge(arr:Array, left:int, mid:int, right:int):void {
            var lp:Array = arr.slice(left, mid + 1);
            var rp:Array = arr.slice(mid + 1, right + 1);
            var i:int = 0, j:int = 0, k:int = left;
            while (i < lp.length && j < rp.length) {
                if (lp[i] <= rp[j]) arr[k++] = lp[i++];
                else arr[k++] = rp[j++];
            }
            while (i < lp.length) arr[k++] = lp[i++];
            while (j < rp.length) arr[k++] = rp[j++];
        }

        public static function sort(arr:Array):Array {
            var n:int = arr.length;
            for (var i:int = 0; i < n; i += MIN_RUN) {
                insertionSort(arr, i, Math.min(i + MIN_RUN - 1, n - 1));
            }
            for (var size:int = MIN_RUN; size < n; size *= 2) {
                for (var left:int = 0; left < n; left += 2 * size) {
                    var mid:int = Math.min(left + size - 1, n - 1);
                    var right:int = Math.min(left + 2 * size - 1, n - 1);
                    if (mid < right) merge(arr, left, mid, right);
                }
            }
            return arr;
        }

        public static function main():void {
            var arr:Array = [5, 2, 8, 1, 9, 3, 7, 4, 6];
            sort(arr);
            trace(arr);
        }
    }
}
