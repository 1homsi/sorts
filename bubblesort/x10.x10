import x10.io.Console;

public class BubbleSort {
    static def bubbleSort(arr: Rail[Long]): void {
        var n: Long = arr.size;
        var swapped: Boolean;
        do {
            swapped = false;
            for (i in 0..(n-2)) {
                if (arr(i) > arr(i+1)) {
                    val tmp = arr(i);
                    arr(i) = arr(i+1);
                    arr(i+1) = tmp;
                    swapped = true;
                }
            }
            n--;
        } while (swapped);
    }

    public static def main(args: Rail[String]): void {
        val arr = new Rail[Long](7, [64, 34, 25, 12, 22, 11, 90]);
        bubbleSort(arr);
        Console.OUT.println(arr);
    }
}
