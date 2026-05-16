class Fantom
{
    static Void countingSort(Int[] arr, Int exp)
    {
        n := arr.size
        output := Int[,]
        n.times { output.add(0) }
        count := Int[,]
        10.times { count.add(0) }
        arr.each |x| { count[(x / exp) % 10]++ }
        (1..9).each |i| { count[i] = count[i] + count[i-1] }
        (n-1).downto(0) |i|
        {
            idx := (arr[i] / exp) % 10
            count[idx] = count[idx] - 1
            output[count[idx]] = arr[i]
        }
        n.times |i| { arr[i] = output[i] }
    }

    static Int[] radixSort(Int[] arr)
    {
        if (arr.isEmpty) return arr
        max := arr.reduce(arr[0]) |Int acc, Int x -> Int| { x > acc ? x : acc }
        exp := 1
        while (max / exp > 0) {
            countingSort(arr, exp)
            exp *= 10
        }
        return arr
    }

    static Void main()
    {
        arr := [170, 45, 75, 90, 802, 24, 2, 66]
        echo(radixSort(arr))
    }
}
