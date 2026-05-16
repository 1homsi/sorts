import java.util.List
import java.util.ArrayList

class MergeSort {
    def static List<Integer> merge(List<Integer> left, List<Integer> right) {
        val result = new ArrayList<Integer>
        var i = 0; var j = 0
        while (i < left.size && j < right.size) {
            if (left.get(i) <= right.get(j)) result.add(left.get(i++))
            else result.add(right.get(j++))
        }
        while (i < left.size) result.add(left.get(i++))
        while (j < right.size) result.add(right.get(j++))
        result
    }

    def static List<Integer> mergeSort(List<Integer> arr) {
        if (arr.size <= 1) return arr
        val mid = arr.size / 2
        val left = mergeSort(arr.subList(0, mid))
        val right = mergeSort(arr.subList(mid, arr.size))
        merge(left, right)
    }

    def static void main(String[] args) {
        val arr = #[38, 27, 43, 3, 9, 82, 10]
        println(mergeSort(arr))
    }
}
