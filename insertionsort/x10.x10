public class InsertionSort {
    public static def sort(arr: Rail[Int]): Rail[Int] {
        val n = arr.size;
        for (i in 1..(n-1)) {
            val key = arr(i);
            var j: Long = i - 1;
            while (j >= 0 && arr(j) > key) {
                arr(j + 1) = arr(j);
                j--;
            }
            arr(j + 1) = key;
        }
        return arr;
    }
}
