sub Main()
    arr = [64, 34, 25, 12, 22, 11, 90]
    bubbleSort(arr)
    for each x in arr
        print x; " ";
    end for
    print ""
end sub

sub bubbleSort(arr as Object)
    n = arr.Count()
    swapped = true
    while swapped
        swapped = false
        for i = 0 to n - 2
            if arr[i] > arr[i+1] then
                tmp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = tmp
                swapped = true
            end if
        end for
        n--
    end while
end sub
