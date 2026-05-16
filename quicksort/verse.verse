QuickSort<public> := module:
    Quicksort<public>(Arr: []int, Low: int, High: int): void =
        if Low < High:
            P := Partition(Arr, Low, High)
            Quicksort(Arr, Low, P - 1)
            Quicksort(Arr, P + 1, High)

    Partition<public>(Arr: []int, Low: int, High: int): int =
        Pivot := Arr[High]
        var I: int = Low
        for J := Low..High - 1:
            if Arr[J] <= Pivot:
                Tmp := Arr[I]
                Arr[I] = Arr[J]
                Arr[J] = Tmp
                I += 1
        Tmp := Arr[I]
        Arr[I] = Arr[High]
        Arr[High] = Tmp
        I
