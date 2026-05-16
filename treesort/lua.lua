local function insert(node, val)
    if node == nil then
        return {val=val, left=nil, right=nil}
    end
    if val < node.val then
        node.left = insert(node.left, val)
    else
        node.right = insert(node.right, val)
    end
    return node
end

local function inorder(node, result)
    if node == nil then return end
    inorder(node.left, result)
    result[#result+1] = node.val
    inorder(node.right, result)
end

local function treesort(arr)
    local root = nil
    for _, val in ipairs(arr) do
        root = insert(root, val)
    end
    local result = {}
    inorder(root, result)
    return result
end

local sorted = treesort({5, 3, 7, 1, 4, 6, 8})
for _, v in ipairs(sorted) do io.write(v .. " ") end
print()
