fun gnomeSort(arr: IntArray) {
    var i = 0
    while (i < arr.size) {
        if (i == 0 || arr[i] >= arr[i - 1]) {
            i++
        } else {
            val temp = arr[i]
            arr[i] = arr[i - 1]
            arr[i - 1] = temp
            i--
        }
    }
}
