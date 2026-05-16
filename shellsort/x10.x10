public class x10 {
    static def shellSort(arr: Rail[Long]): Rail[Long] {
        val n = arr.size;
        var gap: Long = n / 2;
        while (gap > 0) {
            for (i in gap..(n-1)) {
                val temp = arr(i);
                var j: Long = i;
                while (j >= gap && arr(j - gap) > temp) {
                    arr(j) = arr(j - gap);
                    j -= gap;
                }
                arr(j) = temp;
            }
            gap /= 2;
        }
        return arr;
    }

    public static def main(args: Rail[String]): void {
        val arr = new Rail[Long](7, (i: Long) => [64L,34L,25L,12L,22L,11L,90L](i));
        shellSort(arr);
        Console.OUT.println(arr);
    }
}
