Function NewNode(v As Integer) As Object
    node = {}
    node.val = v
    node.left = Invalid
    node.right = Invalid
    Return node
End Function

Function Insert(node As Object, v As Integer) As Object
    If node = Invalid Then Return NewNode(v)
    If v < node.val Then
        node.left = Insert(node.left, v)
    Else
        node.right = Insert(node.right, v)
    End If
    Return node
End Function

Sub Inorder(node As Object, result As Object)
    If node = Invalid Then Return
    Inorder(node.left, result)
    result.Push(node.val)
    Inorder(node.right, result)
End Sub

Function TreeSort(arr As Object) As Object
    root = Invalid
    For Each v In arr
        root = Insert(root, v)
    End For
    result = CreateObject("roArray", 10, True)
    Inorder(root, result)
    Return result
End Function

arr = CreateObject("roArray", 7, False)
arr.Push(5) : arr.Push(3) : arr.Push(7) : arr.Push(1)
arr.Push(4) : arr.Push(6) : arr.Push(8)
sorted = TreeSort(arr)
Print sorted
