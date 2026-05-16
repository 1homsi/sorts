import java.util.ArrayList
import java.util.Collections

class Bogosort {
    def static isSorted(ArrayList<Integer> arr) {
        for (var i = 0; i < arr.size - 1; i++) {
            if (arr.get(i) > arr.get(i + 1)) return false
        }
        true
    }

    def static bogosort(ArrayList<Integer> arr) {
        while (!isSorted(arr)) {
            Collections.shuffle(arr)
        }
        arr
    }

    def static void main(String[] args) {
        val arr = new ArrayList<Integer>(#[3, 1, 4, 1, 5, 9, 2, 6])
        println(bogosort(arr))
    }
}
