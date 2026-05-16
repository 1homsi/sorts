CocktailSort(arr, n) {
    swapped := 1
    start := 1
    ending := n
    While swapped {
        swapped := 0
        Loop, % ending - start {
            i := start + A_Index - 1
            if (arr[i] > arr[i+1]) {
                tmp := arr[i]
                arr[i] := arr[i+1]
                arr[i+1] := tmp
                swapped := 1
            }
        }
        if (!swapped)
            Break
        swapped := 0
        ending--
        i := ending - 1
        While (i >= start) {
            if (arr[i] > arr[i+1]) {
                tmp := arr[i]
                arr[i] := arr[i+1]
                arr[i+1] := tmp
                swapped := 1
            }
            i--
        }
        start++
    }
    return arr
}
