Function heapsort(arr)
    Local n = arr.Length()
    For Local i = n / 2 - 1 To 0 Step -1
        siftdown(arr, i, n)
    Next
    For Local i = n - 1 To 1 Step -1
        Local temp = arr[0]
        arr[0] = arr[i]
        arr[i] = temp
        siftdown(arr, 0, i)
    Next
End

Function siftdown(arr, idx, n)
    Local largest = idx
    Local left = 2 * idx + 1
    Local right = 2 * idx + 2
    
    If left < n And arr[left] > arr[largest] Then
        largest = left
    End
    If right < n And arr[right] > arr[largest] Then
        largest = right
    End
    If largest <> idx Then
        Local temp = arr[idx]
        arr[idx] = arr[largest]
        arr[largest] = temp
        siftdown(arr, largest, n)
    End
End

Function Main()
    Local arr[] = [5, 2, 8, 1, 9, 3]
    heapsort(arr)
    For Local v = Each arr
        Print v
    Next
End
