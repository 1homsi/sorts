class BubbleSort {
    def static void main(String[] args) {
        val arr = #[64, 34, 25, 12, 22, 11, 90]
        val mArr = newIntArrayOfSize(7)
        for (i : 0..6) mArr.set(i, arr.get(i))
        bubbleSort(mArr)
        println(mArr.join(' '))
    }

    def static void bubbleSort(int[] arr) {
        var n = arr.length
        var swapped = true
        while (swapped) {
            swapped = false
            for (i : 0..<n-1) {
                if (arr.get(i) > arr.get(i+1)) {
                    val tmp = arr.get(i)
                    arr.set(i, arr.get(i+1))
                    arr.set(i+1, tmp)
                    swapped = true
                }
            }
            n--
        }
    }
}
