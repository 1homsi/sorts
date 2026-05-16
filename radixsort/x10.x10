import x10.io.Console;
import x10.util.ArrayList;

public class X10 {
    static def countingSort(arr: Rail[Long], exp: Long): void {
        val n = arr.size;
        val output = new Rail[Long](n);
        val count = new Rail[Long](10, 0L);
        for (x in arr) count((x / exp) % 10)++;
        for (i in 1..9) count(i) += count(i-1);
        for (i in (n-1)..0) {
            val idx = (arr(i) / exp) % 10;
            count(idx)--;
            output(count(idx)) = arr(i);
        }
        Rail.copy(output, arr);
    }

    static def radixSort(arr: Rail[Long]): void {
        if (arr.size == 0L) return;
        var max: Long = arr(0);
        for (x in arr) if (x > max) max = x;
        var exp: Long = 1L;
        while (max / exp > 0L) {
            countingSort(arr, exp);
            exp *= 10L;
        }
    }

    public static def main(args: Rail[String]): void {
        val arr = new Rail[Long](8, [170L, 45L, 75L, 90L, 802L, 24L, 2L, 66L]);
        radixSort(arr);
        Console.OUT.println(arr.toString());
    }
}
