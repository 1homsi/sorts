Dim arr(9)
arr(0) = 0.78 : arr(1) = 0.17 : arr(2) = 0.39 : arr(3) = 0.26 : arr(4) = 0.72
arr(5) = 0.94 : arr(6) = 0.21 : arr(7) = 0.12 : arr(8) = 0.23 : arr(9) = 0.68

Dim n : n = 10
Dim minV : minV = arr(0)
Dim maxV : maxV = arr(0)
Dim i, j, idx, b, pos
Dim key

For i = 0 To n - 1
    If arr(i) < minV Then minV = arr(i)
    If arr(i) > maxV Then maxV = arr(i)
Next

Dim buckets(9, 9)
Dim counts(9)
For i = 0 To n - 1 : counts(i) = 0 : Next

For i = 0 To n - 1
    idx = Int((arr(i) - minV) / (maxV - minV + 1) * n)
    If idx >= n Then idx = n - 1
    buckets(idx, counts(idx)) = arr(i)
    counts(idx) = counts(idx) + 1
Next

pos = 0
For b = 0 To n - 1
    For i = 1 To counts(b) - 1
        key = buckets(b, i)
        j = i - 1
        Do While j >= 0 And buckets(b, j) > key
            buckets(b, j + 1) = buckets(b, j)
            j = j - 1
        Loop
        buckets(b, j + 1) = key
    Next
    For i = 0 To counts(b) - 1
        arr(pos) = buckets(b, i)
        pos = pos + 1
    Next
Next

For i = 0 To n - 1
    WScript.Echo arr(i)
Next
