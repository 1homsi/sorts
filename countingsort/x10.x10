import x10.io.Console;

class CountingSort {
    static def sort(arr: Rail[Long]): Rail[Long] {
        val n = arr.size;
        if (n == 0L) return arr;
        var mn: Long = arr(0); var mx: Long = arr(0);
        for (v in arr) {
            if (v < mn) mn = v;
            if (v > mx) mx = v;
        }
        val range = mx - mn + 1;
        val count = new Rail[Long](range, 0L);
        for (v in arr) count(v - mn)++;
        for (i in 1..(range-1)) count(i) += count(i - 1);
        val output = new Rail[Long](n, 0L);
        for (var i: Long = n - 1; i >= 0; i--) {
            count(arr(i) - mn)--;
            output(count(arr(i) - mn)) = arr(i);
        }
        return output;
    }

    public static def main(args: Rail[String]): void {
        val arr: Rail[Long] = [4L, 2L, 2L, 8L, 3L, 3L, 1L];
        val result = sort(arr);
        Console.OUT.println(result);
    }
}
