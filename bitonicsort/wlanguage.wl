PROCEDURE BitonicSort(arr, lo, cnt, dir)
    LOCAL k
    IF cnt > 1
        k = cnt / 2
        BitonicSort(arr, lo, k, 1)
        BitonicSort(arr, lo + k, k, 0)
        BitonicMerge(arr, lo, cnt, dir)
    END
END

PROCEDURE BitonicMerge(arr, lo, cnt, dir)
    LOCAL k, i, tmp
    IF cnt > 1
        k = cnt / 2
        FOR i = lo TO lo + cnt - k - 1
            IF (arr[i] > arr[i + k]) = (dir = 1)
                tmp = arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            END
        END
        BitonicMerge(arr, lo, k, dir)
        BitonicMerge(arr, lo + k, k, dir)
    END
END

PROCEDURE Main()
    LOCAL arr
    arr = [5, 2, 8, 1, 9, 3, 7, 4]
    BitonicSort(arr, 1, 8, 1)
    Trace(arr)
END

Main()
