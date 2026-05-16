package shellsort

class ShellSort {
    def static shellSort(int[] arr) {
        val n = arr.length
        var gap = n / 2
        while (gap > 0) {
            for (var i = gap; i < n; i++) {
                val temp = arr.get(i)
                var j = i
                while (j >= gap && arr.get(j - gap) > temp) {
                    arr.set(j, arr.get(j - gap))
                    j -= gap
                }
                arr.set(j, temp)
            }
            gap /= 2
        }
        arr
    }

    def static void main(String[] args) {
        val arr = #[64, 34, 25, 12, 22, 11, 90]
        println(shellSort(arr))
    }
}
