def bubbleSort(arr) {
    var n := arr.size()
    var swapped := true
    while (swapped) {
        swapped := false
        for i in 0..(n-2) {
            if (arr[i] > arr[i+1]) {
                def tmp := arr[i]
                arr[i] := arr[i+1]
                arr[i+1] := tmp
                swapped := true
            }
        }
        n -= 1
    }
    arr
}

def arr := [64, 34, 25, 12, 22, 11, 90].diverge()
println(bubbleSort(arr))
