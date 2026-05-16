import x10.io.Console;

public class BitonicSort {
    static def compareAndSwap(arr: Rail[Int], i: Long, j: Long, direction: Boolean) {
        if (direction == (arr(i) > arr(j))) {
            val tmp = arr(i);
            arr(i) = arr(j);
            arr(j) = tmp;
        }
    }

    static def bitonicMerge(arr: Rail[Int], lo: Long, cnt: Long, direction: Boolean) {
        if (cnt > 1) {
            val k = cnt / 2;
            for (i in lo..lo+k-1) {
                compareAndSwap(arr, i, i+k, direction);
            }
            bitonicMerge(arr, lo, k, direction);
            bitonicMerge(arr, lo+k, k, direction);
        }
    }

    static def bitonicSort(arr: Rail[Int], lo: Long, cnt: Long, direction: Boolean) {
        if (cnt > 1) {
            val k = cnt / 2;
            bitonicSort(arr, lo, k, true);
            bitonicSort(arr, lo+k, k, false);
            bitonicMerge(arr, lo, cnt, direction);
        }
    }

    public static def main(args: Rail[String]) {
        val data = [3n, 7n, 4n, 8n, 6n, 2n, 1n, 5n] as Rail[Int];
        bitonicSort(data, 0, data.size, true);
        Console.OUT.println(data);
    }
}
