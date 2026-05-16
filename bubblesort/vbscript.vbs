Dim arr(6)
arr(0) = 64 : arr(1) = 34 : arr(2) = 25 : arr(3) = 12
arr(4) = 22 : arr(5) = 11 : arr(6) = 90

n = 7
Do
    swapped = False
    For i = 0 To n - 2
        If arr(i) > arr(i+1) Then
            tmp = arr(i)
            arr(i) = arr(i+1)
            arr(i+1) = tmp
            swapped = True
        End If
    Next
    n = n - 1
Loop While swapped

Dim result
For i = 0 To 6
    result = result & arr(i) & " "
Next
WScript.Echo Trim(result)
