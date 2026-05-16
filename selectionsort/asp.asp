<%
Dim arr(4)
arr(0) = 5: arr(1) = 3: arr(2) = 1: arr(3) = 4: arr(4) = 2
Dim n, i, j, minIdx, tmp
n = 5
For i = 0 To n - 2
    minIdx = i
    For j = i + 1 To n - 1
        If arr(j) < arr(minIdx) Then minIdx = j
    Next
    tmp = arr(i): arr(i) = arr(minIdx): arr(minIdx) = tmp
Next
Response.Write "<ul>"
For i = 0 To n - 1
    Response.Write "<li>" & arr(i) & "</li>"
Next
Response.Write "</ul>"
%>
