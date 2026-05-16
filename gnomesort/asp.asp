<%
Function GnomeSort(arr)
    Dim n, i, tmp
    n = UBound(arr) + 1
    i = 0
    Do While i < n
        If i = 0 Or arr(i) >= arr(i-1) Then
            i = i + 1
        Else
            tmp = arr(i)
            arr(i) = arr(i-1)
            arr(i-1) = tmp
            i = i - 1
        End If
    Loop
    GnomeSort = arr
End Function

Dim data(9)
data(0)=5: data(1)=3: data(2)=8: data(3)=1: data(4)=9
data(5)=2: data(6)=7: data(7)=4: data(8)=6: data(9)=0
Dim sorted
sorted = GnomeSort(data)
Dim k
For k = 0 To 9
    Response.Write sorted(k) & " "
Next
%>
