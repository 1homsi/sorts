public class x10 {
    static def partition(arr: Rail[Int], low: Int, high: Int): Int {
        val pivot = arr(high);
        var i: Int = low;
        for (j in low..(high-1)) {
            if (arr(j) <= pivot) {
                val tmp = arr(i); arr(i) = arr(j); arr(j) = tmp;
                i++;
            }
        }
        val tmp = arr(i); arr(i) = arr(high); arr(high) = tmp;
        return i;
    }

    static def quicksort(arr: Rail[Int], low: Int, high: Int): void {
        if (low < high) {
            val p = partition(arr, low, high);
            quicksort(arr, low, p - 1n);
            quicksort(arr, p + 1n, high);
        }
    }

    public static def main(args: Rail[String]): void {
        val arr = new Rail[Int](7, [3n, 6n, 8n, 10n, 1n, 2n, 1n]);
        quicksort(arr, 0n, 6n);
        Console.OUT.println(arr);
    }
}
