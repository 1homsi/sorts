import java.util.List
import java.util.ArrayList

class Heapsort {
    def static void heapify(List<Integer> arr, int n, int i) {
        var largest = i
        val left = 2 * i + 1
        val right = 2 * i + 2
        if (left < n && arr.get(left) > arr.get(largest)) largest = left
        if (right < n && arr.get(right) > arr.get(largest)) largest = right
        if (largest != i) {
            val tmp = arr.get(i)
            arr.set(i, arr.get(largest))
            arr.set(largest, tmp)
            heapify(arr, n, largest)
        }
    }

    def static List<Integer> heapsort(List<Integer> arr) {
        val n = arr.size
        for (var i = n / 2 - 1; i >= 0; i--) heapify(arr, n, i)
        for (var i = n - 1; i > 0; i--) {
            val tmp = arr.get(0)
            arr.set(0, arr.get(i))
            arr.set(i, tmp)
            heapify(arr, i, 0)
        }
        arr
    }

    def static void main(String[] args) {
        val arr = new ArrayList<Integer>(#[12, 11, 13, 5, 6, 7])
        heapsort(arr)
        println(arr)
    }
}
