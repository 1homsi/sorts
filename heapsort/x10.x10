import x10.io.Console;

public class x10 {
    static def heapify(arr: Rail[Int], n: Int, i: Int): void {
        var largest: Int = i;
        val left = 2n * i + 1n;
        val right = 2n * i + 2n;
        if (left < n && arr(left) > arr(largest)) largest = left;
        if (right < n && arr(right) > arr(largest)) largest = right;
        if (largest != i) {
            val tmp = arr(i); arr(i) = arr(largest); arr(largest) = tmp;
            heapify(arr, n, largest);
        }
    }

    static def heapsort(arr: Rail[Int]): void {
        val n = arr.size as Int;
        for (var i: Int = n/2n - 1n; i >= 0n; i--) heapify(arr, n, i);
        for (var i: Int = n - 1n; i > 0n; i--) {
            val tmp = arr(0n); arr(0n) = arr(i); arr(i) = tmp;
            heapify(arr, i, 0n);
        }
    }

    public static def main(args: Rail[String]): void {
        val arr = [12n, 11n, 13n, 5n, 6n, 7n] as Rail[Int];
        heapsort(arr);
        Console.OUT.println(arr);
    }
}
