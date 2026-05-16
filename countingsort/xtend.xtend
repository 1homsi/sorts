import java.util.Arrays

class CountingSort {
    def static int[] sort(int[] arr) {
        if (arr.length == 0) return arr
        var min = arr.get(0)
        var max = arr.get(0)
        for (v : arr) {
            if (v < min) min = v
            if (v > max) max = v
        }
        val range = max - min + 1
        val count = newIntArrayOfSize(range)
        for (v : arr) count.set(v - min, count.get(v - min) + 1)
        for (i : 1..<range) count.set(i, count.get(i) + count.get(i - 1))
        val output = newIntArrayOfSize(arr.length)
        for (i : (arr.length - 1)..0) {
            count.set(arr.get(i) - min, count.get(arr.get(i) - min) - 1)
            output.set(count.get(arr.get(i) - min), arr.get(i))
        }
        output
    }

    def static void main(String[] args) {
        println(Arrays.toString(sort(#[4, 2, 2, 8, 3, 3, 1])))
    }
}
