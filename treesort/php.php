<?php
function insert($node, $val) {
    if ($node === null) return ['val' => $val, 'left' => null, 'right' => null];
    if ($val < $node['val']) $node['left'] = insert($node['left'], $val);
    else $node['right'] = insert($node['right'], $val);
    return $node;
}

function inorder($node, &$result) {
    if ($node === null) return;
    inorder($node['left'], $result);
    $result[] = $node['val'];
    inorder($node['right'], $result);
}

function treesort($arr) {
    $root = null;
    foreach ($arr as $val) $root = insert($root, $val);
    $result = [];
    inorder($root, $result);
    return $result;
}

print_r(treesort([5, 3, 7, 1, 4, 6, 8]));
