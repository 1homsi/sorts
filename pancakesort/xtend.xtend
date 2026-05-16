class PancakeSort {
    def static void flip(int[] arr, int k) {
        var left = 0
        var right = k
        while (left < right) {
            val tmp = arr.get(left)
            arr.set(left, arr.get(right))
            arr.set(right, tmp)
            left++
            right--
        }
    }

    def static int[] pancakeSort(int[] arr) {
        var size = arr.length
        while (size > 1) {
            var maxIdx = 0
            for (i : 1..<size) {
                if (arr.get(i) > arr.get(maxIdx)) maxIdx = i
            }
            if (maxIdx != size - 1) {
                if (maxIdx != 0) flip(arr, maxIdx)
                flip(arr, size - 1)
            }
            size--
        }
        arr
    }

    def static void main(String[] args) {
        val arr = #[3, 6, 2, 7, 4, 1, 5]
        println(pancakeSort(arr).join(', '))
    }
}
