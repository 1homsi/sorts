import x10.io.Console;

public class x10 {
    static def stoogeSort(arr: Rail[Int], first: Long, last: Long): void {
        if (arr(first) > arr(last)) {
            val tmp = arr(first);
            arr(first) = arr(last);
            arr(last) = tmp;
        }
        val n = last - first + 1;
        if (n > 2) {
            val t = n * 2 / 3;
            stoogeSort(arr, first, first + t - 1);
            stoogeSort(arr, last - t + 1, last);
            stoogeSort(arr, first, first + t - 1);
        }
    }

    public static def main(args: Rail[String]): void {
        val arr = new Rail[Int](8, (i: Long) => [3n,1n,4n,1n,5n,9n,2n,6n](i));
        stoogeSort(arr, 0, 7);
        for (x in arr) Console.OUT.print(x + " ");
        Console.OUT.println();
    }
}
