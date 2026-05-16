import x10.util.Random;
import x10.io.Console;

public class Bogosort {
    static def isSorted(arr: Rail[Int]): Boolean {
        for (i in 0..(arr.size - 2)) {
            if (arr(i) > arr(i + 1)) return false;
        }
        return true;
    }

    static def shuffle(arr: Rail[Int]) {
        val rng = new Random();
        val n = arr.size;
        for (var i: Int = n - 1; i > 0; i--) {
            val j = rng.nextInt(i + 1);
            val tmp = arr(i);
            arr(i) = arr(j);
            arr(j) = tmp;
        }
    }

    static def bogosort(arr: Rail[Int]) {
        while (!isSorted(arr)) shuffle(arr);
    }

    public static def main(args: Rail[String]) {
        val arr = [3n, 1n, 4n, 1n, 5n, 9n, 2n, 6n] as Rail[Int];
        bogosort(arr);
        Console.OUT.println(arr);
    }
}
