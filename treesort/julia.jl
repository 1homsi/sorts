mutable struct Node
    val::Int
    left::Union{Node,Nothing}
    right::Union{Node,Nothing}
    Node(v) = new(v, nothing, nothing)
end

function insert(node, val)
    isnothing(node) && return Node(val)
    if val < node.val
        node.left = insert(node.left, val)
    else
        node.right = insert(node.right, val)
    end
    node
end

function inorder(node, result)
    isnothing(node) && return
    inorder(node.left, result)
    push!(result, node.val)
    inorder(node.right, result)
end

function treesort(arr)
    root = nothing
    for val in arr
        root = insert(root, val)
    end
    result = Int[]
    inorder(root, result)
    result
end

println(treesort([5, 3, 7, 1, 4, 6, 8]))
