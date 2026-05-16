Class Node
  Field value:Int
  Field left:Node
  Field right:Node

  Method New:Node(v:Int)
    value = v
    Return Self
  End
End

Function Insert:Node(node:Node, val:Int)
  If Not node Then Return New Node(val)
  If val < node.value Then node.left = Insert(node.left, val)
  If val > node.value Then node.right = Insert(node.right, val)
  Return node
End

Function Inorder(node:Node)
  If node Then
    Inorder(node.left)
    Print(node.value)
    Inorder(node.right)
  End
End

Local root:Node = Null
Local arr:Int[] = [5, 2, 8, 1, 9, 3]
For Local v:Int = EachIn arr
  root = Insert(root, v)
End
Inorder(root)
