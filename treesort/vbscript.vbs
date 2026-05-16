Dim nodeVal(100), nodeLeft(100), nodeRight(100), nodeCount
nodeCount = 0

Function NewNode(v)
    nodeCount = nodeCount + 1
    nodeVal(nodeCount) = v
    nodeLeft(nodeCount) = 0
    nodeRight(nodeCount) = 0
    NewNode = nodeCount
End Function

Sub Insert(ByRef idx, v)
    If idx = 0 Then
        idx = NewNode(v)
    ElseIf v < nodeVal(idx) Then
        Insert nodeLeft(idx), v
    Else
        Insert nodeRight(idx), v
    End If
End Sub

Sub Inorder(idx)
    If idx = 0 Then Exit Sub
    Inorder nodeLeft(idx)
    WScript.StdOut.Write nodeVal(idx) & " "
    Inorder nodeRight(idx)
End Sub

Dim arr(6), root, i
arr(0)=5: arr(1)=3: arr(2)=7: arr(3)=1: arr(4)=4: arr(5)=6: arr(6)=8
root = 0
For i = 0 To 6
    Insert root, arr(i)
Next
Inorder root
WScript.Echo ""
