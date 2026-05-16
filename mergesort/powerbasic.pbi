Global Arr(6) As Long, Tmp(6) As Long

Sub Merge(lo As Long, mid As Long, hi As Long)
    Dim i As Long, j As Long, k As Long, x As Long
    i = lo: j = mid + 1: k = lo
    Do While i <= mid And j <= hi
        If Arr(i) <= Arr(j) Then
            Tmp(k) = Arr(i): i = i + 1
        Else
            Tmp(k) = Arr(j): j = j + 1
        End If
        k = k + 1
    Loop
    Do While i <= mid: Tmp(k) = Arr(i): i = i+1: k = k+1: Loop
    Do While j <= hi: Tmp(k) = Arr(j): j = j+1: k = k+1: Loop
    For x = lo To hi: Arr(x) = Tmp(x): Next x
End Sub

Sub MergeSort(lo As Long, hi As Long)
    Dim mid As Long
    If lo >= hi Then Exit Sub
    mid = (lo + hi) \ 2
    MergeSort lo, mid
    MergeSort mid + 1, hi
    Merge lo, mid, hi
End Sub

Function PBMain() As Long
    Arr(0)=38: Arr(1)=27: Arr(2)=43: Arr(3)=3
    Arr(4)=9: Arr(5)=82: Arr(6)=10
    MergeSort 0, 6
    Dim i As Long
    For i = 0 To 6: Print Str$(Arr(i)) & " ";: Next i
    Print
End Function
