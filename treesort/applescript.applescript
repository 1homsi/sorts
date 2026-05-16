on insert(nodeList, nodeCount, idx, v)
    if idx is 0 then
        set nodeCount to nodeCount + 1
        set end of nodeList to {v, 0, 0}
        return nodeCount
    end if
    set nd to item idx of nodeList
    if v < item 1 of nd then
        set leftIdx to item 2 of nd
        set newLeft to insert(nodeList, nodeCount, leftIdx, v)
        set item 2 of item idx of nodeList to newLeft
    else
        set rightIdx to item 3 of nd
        set newRight to insert(nodeList, nodeCount, rightIdx, v)
        set item 3 of item idx of nodeList to newRight
    end if
    return idx
end insert

on inorder(nodeList, idx, result)
    if idx is 0 then return
    set nd to item idx of nodeList
    inorder(nodeList, item 2 of nd, result)
    set end of result to item 1 of nd
    inorder(nodeList, item 3 of nd, result)
end inorder

set arr to {5, 3, 7, 1, 4, 6, 8}
set nodeList to {}
set nodeCount to 0
set rootIdx to 0
repeat with v in arr
    set rootIdx to insert(nodeList, nodeCount, rootIdx, v)
end repeat
set result to {}
inorder(nodeList, rootIdx, result)
return result
