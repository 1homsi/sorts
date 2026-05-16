def countingSort(arr, exp) {
    def n = arr.size()
    def output = new int[n]
    def count = new int[10]
    arr.each { count[(it / exp).toInteger() % 10]++ }
    (1..9).each { count[it] += count[it - 1] }
    (n - 1..0).each {
        def idx = (arr[it] / exp).toInteger() % 10
        output[--count[idx]] = arr[it]
    }
    n.times { arr[it] = output[it] }
}

def radixSort(arr) {
    if (!arr) return arr
    def max = arr.max()
    def exp = 1
    while ((max / exp).toInteger() > 0) {
        countingSort(arr, exp)
        exp *= 10
    }
    arr
}

def arr = [170, 45, 75, 90, 802, 24, 2, 66]
println radixSort(arr)
