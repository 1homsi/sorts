class TimSort {
    static final MIN_RUN = 32;

    static function insertionSort(arr:Array<Int>, left:Int, right:Int):Void {
        var i = left + 1;
        while (i <= right) {
            var key = arr[i];
            var j = i - 1;
            while (j >= left && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
            i++;
        }
    }

    static function merge(arr:Array<Int>, left:Int, mid:Int, right:Int):Void {
        var lp = arr.slice(left, mid + 1);
        var rp = arr.slice(mid + 1, right + 1);
        var i = 0; var j = 0; var k = left;
        while (i < lp.length && j < rp.length) {
            if (lp[i] <= rp[j]) arr[k++] = lp[i++];
            else arr[k++] = rp[j++];
        }
        while (i < lp.length) arr[k++] = lp[i++];
        while (j < rp.length) arr[k++] = rp[j++];
    }

    static function timsort(arr:Array<Int>):Array<Int> {
        var n = arr.length;
        var i = 0;
        while (i < n) {
            insertionSort(arr, i, Std.int(Math.min(i + MIN_RUN - 1, n - 1)));
            i += MIN_RUN;
        }
        var size = MIN_RUN;
        while (size < n) {
            var left = 0;
            while (left < n) {
                var mid = Std.int(Math.min(left + size - 1, n - 1));
                var right = Std.int(Math.min(left + 2 * size - 1, n - 1));
                if (mid < right) merge(arr, left, mid, right);
                left += 2 * size;
            }
            size *= 2;
        }
        return arr;
    }

    static function main():Void {
        var arr = [5, 2, 8, 1, 9, 3, 7, 4, 6];
        timsort(arr);
        trace(arr);
    }
}
