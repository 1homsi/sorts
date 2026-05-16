class Node
  property val : Int32
  property left : Node?
  property right : Node?

  def initialize(@val : Int32)
  end
end

def insert(node : Node?, val : Int32) : Node
  return Node.new(val) if node.nil?
  if val < node.val
    node.left = insert(node.left, val)
  else
    node.right = insert(node.right, val)
  end
  node
end

def inorder(node : Node?, result : Array(Int32))
  return if node.nil?
  inorder(node.left, result)
  result << node.val
  inorder(node.right, result)
end

def treesort(arr : Array(Int32)) : Array(Int32)
  root : Node? = nil
  arr.each { |v| root = insert(root, v) }
  result = [] of Int32
  inorder(root, result)
  result
end

puts treesort([5, 3, 7, 1, 4, 6, 8])
