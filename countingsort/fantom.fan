class CountingSort {
    static Int[] sort(Int[] arr) {
        n := arr.size
        if (n == 0) return arr
        min := arr[0]; max := arr[0]
        arr.each |v| {
            if (v < min) min = v
            if (v > max) max = v
        }
        range := max - min + 1
        count := Int[,].fill(0, range)
        arr.each |v| { count[v - min]++ }
        (1..<range).each |i| { count[i] += count[i - 1] }
        output := Int[,].fill(0, n)
        (n - 1).downto(0) |i| {
            count[arr[i] - min]--
            output[count[arr[i] - min]] = arr[i]
        }
        return output
    }

    static Void main() {
        result := sort([4, 2, 2, 8, 3, 3, 1])
        echo(result)
    }
}
