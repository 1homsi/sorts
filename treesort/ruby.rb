class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def insert(node, val)
  return Node.new(val) if node.nil?
  if val < node.val
    node.left = insert(node.left, val)
  else
    node.right = insert(node.right, val)
  end
  node
end

def inorder(node, result)
  return if node.nil?
  inorder(node.left, result)
  result << node.val
  inorder(node.right, result)
end

def treesort(arr)
  root = nil
  arr.each { |val| root = insert(root, val) }
  result = []
  inorder(root, result)
  result
end

p treesort([5, 3, 7, 1, 4, 6, 8])
