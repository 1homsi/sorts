class CombSort {
    def static sort(int[] arr) {
        val n = arr.length
        var gap = n
        var sorted = false
        while (!sorted) {
            gap = (gap / 1.3) as int
            if (gap <= 1) {
                gap = 1
                sorted = true
            }
            for (var i = 0; i + gap < n; i++) {
                if (arr.get(i) > arr.get(i + gap)) {
                    val tmp = arr.get(i)
                    arr.set(i, arr.get(i + gap))
                    arr.set(i + gap, tmp)
                    sorted = false
                }
            }
        }
        arr
    }
}
