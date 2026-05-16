class GnomeSort {
    def static gnomeSort(int[] arr) {
        var i = 0
        val n = arr.length
        while (i < n) {
            if (i == 0 || arr.get(i) >= arr.get(i - 1)) {
                i++
            } else {
                val tmp = arr.get(i)
                arr.set(i, arr.get(i - 1))
                arr.set(i - 1, tmp)
                i--
            }
        }
        arr
    }
}
