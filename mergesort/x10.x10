public class MergeSort {
    static def merge(left: Rail[Long], right: Rail[Long]): Rail[Long] {
        val result = new Rail[Long](left.size + right.size);
        var i: Long = 0; var j: Long = 0; var k: Long = 0;
        while (i < left.size && j < right.size) {
            if (left(i) <= right(j)) { result(k++) = left(i++); }
            else { result(k++) = right(j++); }
        }
        while (i < left.size) result(k++) = left(i++);
        while (j < right.size) result(k++) = right(j++);
        return result;
    }

    static def mergeSort(arr: Rail[Long]): Rail[Long] {
        if (arr.size <= 1) return arr;
        val mid = arr.size / 2;
        val left = mergeSort(new Rail[Long](mid, (i:Long)=>arr(i)));
        val right = mergeSort(new Rail[Long](arr.size-mid, (i:Long)=>arr(mid+i)));
        return merge(left, right);
    }

    public static def main(args: Rail[String]) {
        val arr: Rail[Long] = [38L,27L,43L,3L,9L,82L,10L];
        Console.OUT.println(mergeSort(arr));
    }
}
