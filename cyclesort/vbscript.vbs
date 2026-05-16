Dim arr(4)
arr(0) = 5 : arr(1) = 4 : arr(2) = 3 : arr(3) = 2 : arr(4) = 1
Dim n : n = 5
Dim writes : writes = 0

Dim cycleStart, item, pos, i, tmp
For cycleStart = 0 To n - 2
    item = arr(cycleStart)
    pos = cycleStart
    For i = cycleStart + 1 To n - 1
        If arr(i) < item Then pos = pos + 1
    Next
    If pos <> cycleStart Then
        Do While item = arr(pos) : pos = pos + 1 : Loop
        tmp = arr(pos) : arr(pos) = item : item = tmp
        writes = writes + 1
        Do While pos <> cycleStart
            pos = cycleStart
            For i = cycleStart + 1 To n - 1
                If arr(i) < item Then pos = pos + 1
            Next
            Do While item = arr(pos) : pos = pos + 1 : Loop
            tmp = arr(pos) : arr(pos) = item : item = tmp
            writes = writes + 1
        Loop
    End If
Next

Dim output : output = ""
For i = 0 To n - 1
    output = output & arr(i) & " "
Next
WScript.Echo output
