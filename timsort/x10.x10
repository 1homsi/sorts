import x10.io.Console;

public class TimSort {
    static val MIN_RUN = 32n;

    static def insertionSort(arr: Rail[Int], left: Int, right: Int) {
        for (var i: Int = left + 1n; i <= right; i++) {
            val key = arr(i);
            var j: Int = i - 1n;
            while (j >= left && arr(j) > key) {
                arr(j + 1n) = arr(j);
                j--;
            }
            arr(j + 1n) = key;
        }
    }

    static def merge(arr: Rail[Int], left: Int, mid: Int, right: Int) {
        val lp = new Rail[Int](mid - left + 1n, (i: Long) => arr(left + i as Int));
        val rp = new Rail[Int](right - mid as Long, (i: Long) => arr(mid + 1n + i as Int));
        var i: Int = 0n; var j: Int = 0n; var k: Int = left;
        while (i < lp.size as Int && j < rp.size as Int) {
            if (lp(i) <= rp(j)) arr(k++) = lp(i++);
            else arr(k++) = rp(j++);
        }
        while (i < lp.size as Int) arr(k++) = lp(i++);
        while (j < rp.size as Int) arr(k++) = rp(j++);
    }

    static def timsort(arr: Rail[Int]) {
        val n = arr.size as Int;
        var i: Int = 0n;
        while (i < n) {
            insertionSort(arr, i, Math.min(i + MIN_RUN - 1n, n - 1n));
            i += MIN_RUN;
        }
        var size: Int = MIN_RUN;
        while (size < n) {
            var left: Int = 0n;
            while (left < n) {
                val mid = Math.min(left + size - 1n, n - 1n);
                val right = Math.min(left + 2n * size - 1n, n - 1n);
                if (mid < right) merge(arr, left, mid, right);
                left += 2n * size;
            }
            size *= 2n;
        }
    }

    public static def main(args: Rail[String]) {
        val arr = new Rail[Int](9n, [5n, 2n, 8n, 1n, 9n, 3n, 7n, 4n, 6n]);
        timsort(arr);
        for (x in arr) Console.OUT.print(x + " ");
        Console.OUT.println();
    }
}
