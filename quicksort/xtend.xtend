import java.util.List
import java.util.ArrayList

class Quicksort {
    def static void quicksort(List<Integer> arr, int low, int high) {
        if (low < high) {
            val p = partition(arr, low, high)
            quicksort(arr, low, p - 1)
            quicksort(arr, p + 1, high)
        }
    }

    def static int partition(List<Integer> arr, int low, int high) {
        val pivot = arr.get(high)
        var i = low
        for (j : low ..< high) {
            if (arr.get(j) <= pivot) {
                val tmp = arr.get(i); arr.set(i, arr.get(j)); arr.set(j, tmp)
                i++
            }
        }
        val tmp = arr.get(i); arr.set(i, arr.get(high)); arr.set(high, tmp)
        i
    }

    def static void main(String[] args) {
        val arr = new ArrayList<Integer>(#[3, 6, 8, 10, 1, 2, 1])
        quicksort(arr, 0, arr.size - 1)
        println(arr)
    }
}
