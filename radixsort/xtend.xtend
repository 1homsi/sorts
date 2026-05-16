import java.util.List
import java.util.ArrayList
import java.util.Arrays

class Xtend {
    def static countingSort(int[] arr, int exp) {
        val n = arr.length
        val output = newIntArrayOfSize(n)
        val count = newIntArrayOfSize(10)
        for (x : arr) count.set((x / exp) % 10, count.get((x / exp) % 10) + 1)
        for (i : 1..9) count.set(i, count.get(i) + count.get(i - 1))
        for (i : (n - 1)..0) {
            val idx = (arr.get(i) / exp) % 10
            count.set(idx, count.get(idx) - 1)
            output.set(count.get(idx), arr.get(i))
        }
        System.arraycopy(output, 0, arr, 0, n)
    }

    def static sort(int[] arr) {
        if (arr.length == 0) return
        val max = arr.max
        var exp = 1
        while (max / exp > 0) {
            countingSort(arr, exp)
            exp = exp * 10
        }
    }

    def static main(String[] args) {
        val arr = #[170, 45, 75, 90, 802, 24, 2, 66]
        sort(arr)
        println(Arrays.toString(arr))
    }
}
