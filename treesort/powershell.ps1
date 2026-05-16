function New-Node($val) {
    return @{ val = $val; left = $null; right = $null }
}

function Insert($node, $val) {
    if ($null -eq $node) { return New-Node $val }
    if ($val -lt $node.val) { $node.left = Insert $node.left $val }
    else { $node.right = Insert $node.right $val }
    return $node
}

function Inorder($node, $result) {
    if ($null -eq $node) { return }
    Inorder $node.left $result
    $result.Add($node.val)
    Inorder $node.right $result
}

function TreeSort($arr) {
    $root = $null
    foreach ($val in $arr) { $root = Insert $root $val }
    $result = [System.Collections.Generic.List[int]]::new()
    Inorder $root $result
    return $result
}

Write-Output (TreeSort @(5, 3, 7, 1, 4, 6, 8))
