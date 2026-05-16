def countingSort(arr) {
    if (!arr) return arr
    def min = arr.min(), max = arr.max()
    def range = max - min + 1
    def count = new int[range]
    arr.each { count[it - min]++ }
    (1..<range).each { count[it] += count[it - 1] }
    def output = new int[arr.size()]
    arr.reverseEach {
        output[--count[it - min]] = it
    }
    output.toList()
}

println countingSort([4, 2, 2, 8, 3, 3, 1])
