import java.util.ArrayList

class Node
    attr_accessor val:int, left:Node, right:Node
    def initialize(v:int)
        @val = v
        @left = nil
        @right = nil
    end
end

def insert(node:Node, val:int):Node
    return Node.new(val) if node.nil?
    if val < node.val
        node.left = insert(node.left, val)
    else
        node.right = insert(node.right, val)
    end
    node
end

def inorder(node:Node, result:ArrayList)
    return if node.nil?
    inorder(node.left, result)
    result.add(node.val)
    inorder(node.right, result)
end

def treesort(arr:int[]):ArrayList
    root = nil
    arr.each {|v| root = insert(root, v)}
    result = ArrayList.new
    inorder(root, result)
    result
end

puts treesort([5, 3, 7, 1, 4, 6, 8])
