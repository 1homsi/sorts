class CocktailSort {
    def static int[] cocktailSort(int[] arr) {
        var swapped = true
        var start = 0
        var end = arr.length - 1
        while (swapped) {
            swapped = false
            for (var i = start; i < end; i++) {
                if (arr.get(i) > arr.get(i + 1)) {
                    val tmp = arr.get(i)
                    arr.set(i, arr.get(i + 1))
                    arr.set(i + 1, tmp)
                    swapped = true
                }
            }
            if (!swapped) return arr
            swapped = false
            end--
            for (var i = end - 1; i >= start; i--) {
                if (arr.get(i) > arr.get(i + 1)) {
                    val tmp = arr.get(i)
                    arr.set(i, arr.get(i + 1))
                    arr.set(i + 1, tmp)
                    swapped = true
                }
            }
            start++
        }
        arr
    }
}
