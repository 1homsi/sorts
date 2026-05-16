Imports System.Collections.Generic

Class Node
    Public Val As Integer
    Public Left As Node
    Public Right As Node
    Public Sub New(v As Integer)
        Val = v
    End Sub
End Class

Module TreeSort
    Function Insert(node As Node, val As Integer) As Node
        If node Is Nothing Then Return New Node(val)
        If val < node.Val Then node.Left = Insert(node.Left, val)
        Else node.Right = Insert(node.Right, val)
        Return node
    End Function

    Sub Inorder(node As Node, result As List(Of Integer))
        If node Is Nothing Then Return
        Inorder(node.Left, result)
        result.Add(node.Val)
        Inorder(node.Right, result)
    End Sub

    Function Treesort(arr As Integer()) As List(Of Integer)
        Dim root As Node = Nothing
        For Each val In arr
            root = Insert(root, val)
        Next
        Dim result As New List(Of Integer)
        Inorder(root, result)
        Return result
    End Function

    Sub Main()
        Dim sorted = Treesort(New Integer() {5, 3, 7, 1, 4, 6, 8})
        Console.WriteLine(String.Join(" ", sorted))
    End Sub
End Module
