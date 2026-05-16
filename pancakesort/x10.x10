public class PancakeSort {
    static def flip(arr: Rail[Int], k: Int): void {
        var left: Int = 0n;
        var right: Int = k;
        while (left < right) {
            val tmp = arr(left);
            arr(left) = arr(right);
            arr(right) = tmp;
            left++;
            right--;
        }
    }

    static def findMaxIdx(arr: Rail[Int], size: Int): Int {
        var maxIdx: Int = 0n;
        for (i in 1n..size-1n) {
            if (arr(i) > arr(maxIdx)) maxIdx = i;
        }
        return maxIdx;
    }

    static def pancakeSort(arr: Rail[Int]): void {
        var size: Int = arr.size as Int;
        while (size > 1n) {
            val maxIdx = findMaxIdx(arr, size);
            if (maxIdx != size - 1n) {
                if (maxIdx != 0n) flip(arr, maxIdx);
                flip(arr, size - 1n);
            }
            size--;
        }
    }

    public static def main(args: Rail[String]): void {
        val arr = new Rail[Int](7n, [3n,6n,2n,7n,4n,1n,5n] as Rail[Int]);
        pancakeSort(arr);
        Console.OUT.println(arr);
    }
}
