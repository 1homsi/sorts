Imports System
Imports System.Collections.Generic

Module BucketSort
    Sub InsertionSort(bucket As List(Of Double))
        Dim n As Integer = bucket.Count
        For i As Integer = 1 To n - 1
            Dim key As Double = bucket(i)
            Dim j As Integer = i - 1
            While j >= 0 AndAlso bucket(j) > key
                bucket(j + 1) = bucket(j)
                j -= 1
            End While
            bucket(j + 1) = key
        Next
    End Sub

    Function BucketSortArr(arr As Double()) As Double()
        Dim n As Integer = arr.Length
        If n = 0 Then Return arr
        Dim minV As Double = Double.MaxValue, maxV As Double = Double.MinValue
        For Each v As Double In arr
            If v < minV Then minV = v
            If v > maxV Then maxV = v
        Next
        Dim buckets(n - 1) As List(Of Double)
        For i As Integer = 0 To n - 1
            buckets(i) = New List(Of Double)()
        Next
        For Each num As Double In arr
            Dim idx As Integer = CInt(Math.Floor((num - minV) / (maxV - minV + 1) * n))
            If idx >= n Then idx = n - 1
            buckets(idx).Add(num)
        Next
        Dim result As New List(Of Double)()
        For Each bucket As List(Of Double) In buckets
            InsertionSort(bucket)
            result.AddRange(bucket)
        Next
        Return result.ToArray()
    End Function

    Sub Main()
        Dim data() As Double = {0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68}
        Console.WriteLine(String.Join(", ", BucketSortArr(data)))
    End Sub
End Module
