public class CocktailSort {
    public static def sort(arr: Rail[Int]): Rail[Int] {
        var swapped: Boolean = true;
        var start: Long = 0;
        var end: Long = arr.size - 1;
        while (swapped) {
            swapped = false;
            for (i in start..(end-1)) {
                if (arr(i) > arr(i + 1)) {
                    val tmp = arr(i);
                    arr(i) = arr(i + 1);
                    arr(i + 1) = tmp;
                    swapped = true;
                }
            }
            if (!swapped) break;
            swapped = false;
            end--;
            for (i in ((start)..(end-1)).reversed()) {
                if (arr(i) > arr(i + 1)) {
                    val tmp = arr(i);
                    arr(i) = arr(i + 1);
                    arr(i + 1) = tmp;
                    swapped = true;
                }
            }
            start++;
        }
        return arr;
    }
}
