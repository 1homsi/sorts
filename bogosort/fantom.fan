class Bogosort {
    static Bool isSorted(Int[] arr) {
        for (Int i := 0; i < arr.size - 1; ++i) {
            if (arr[i] > arr[i + 1]) return false
        }
        return true
    }

    static Void shuffle(Int[] arr) {
        Int n := arr.size
        for (Int i := n - 1; i > 0; --i) {
            Int j := Int.random(0..<(i + 1))
            Int tmp := arr[i]
            arr[i] = arr[j]
            arr[j] = tmp
        }
    }

    static Int[] bogosort(Int[] arr) {
        while (!isSorted(arr)) shuffle(arr)
        return arr
    }

    static Void main() {
        Int[] arr := [3, 1, 4, 1, 5, 9, 2, 6]
        Env.cur.out.printLine(bogosort(arr).toStr)
    }
}
