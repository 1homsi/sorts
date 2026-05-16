Function BitonicSort(arr:Array<Int>, lo:Int, cnt:Int, dir:Int)
    If cnt > 1
        Local k:Int = cnt / 2
        BitonicSort(arr, lo, k, 1)
        BitonicSort(arr, lo + k, k, 0)
        BitonicMerge(arr, lo, cnt, dir)
    End
End

Function BitonicMerge(arr:Array<Int>, lo:Int, cnt:Int, dir:Int)
    If cnt > 1
        Local k:Int = cnt / 2
        For Local i:Int = lo Until i >= lo + cnt - k
            If ((arr[i] > arr[i + k]) = (dir = 1))
                Local tmp:Int = arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            End
        End
        BitonicMerge(arr, lo, k, dir)
        BitonicMerge(arr, lo + k, k, dir)
    End
End

Function Main()
    Local arr:Array<Int> = [5, 2, 8, 1, 9, 3, 7, 4]
    BitonicSort(arr, 0, 8, 1)
    Print(arr)
End

Main()
