local struct Node
  value : int
  left : &Node
  right : &Node
end

local function insert(node : &Node, val : int) : &Node
  if node == nil then
    local n : Node = {value = val, left = nil, right = nil}
    return &n
  end
  if val < node.value then
    node.left = insert(node.left, val)
  elseif val > node.value then
    node.right = insert(node.right, val)
  end
  return node
end

local function inorder(node : &Node)
  if node ~= nil then
    inorder(node.left)
    print(node.value)
    inorder(node.right)
  end
end

local arr = {5, 2, 8, 1, 9, 3}
local root : &Node = nil
for i, val in ipairs(arr) do
  root = insert(root, val)
end
inorder(root)
