<?hh
class Node {
  public int $val;
  public ?Node $left = null;
  public ?Node $right = null;
  public function __construct(int $v) { $this->val = $v; }
}

function insert(?Node $node, int $val): Node {
  if ($node === null) { return new Node($val); }
  if ($val < $node->val) { $node->left = insert($node->left, $val); }
  else if ($val > $node->val) { $node->right = insert($node->right, $val); }
  return $node;
}

function inorder(?Node $node, vec<int> &$result): void {
  if ($node === null) { return; }
  inorder($node->left, $result);
  $result[] = $node->val;
  inorder($node->right, $result);
}

function treeSort(vec<int> $arr): vec<int> {
  $root = null;
  foreach ($arr as $val) { $root = insert($root, $val); }
  $result = vec[];
  inorder($root, $result);
  return $result;
}

$result = treeSort(vec[5, 2, 8, 1, 9, 3]);
echo implode(", ", $result) . "\n";
