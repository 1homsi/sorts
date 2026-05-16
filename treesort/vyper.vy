# @version ^0.3.0

struct Node:
    val: int128
    left: uint256
    right: uint256

nodes: Node[1000]
node_count: uint256
root: uint256
has_root: bool

@internal
def _insert(idx: uint256, v: int128):
    if v < self.nodes[idx].val:
        if self.nodes[idx].left == 0:
            self.node_count += 1
            self.nodes[self.node_count] = Node({val: v, left: 0, right: 0})
            self.nodes[idx].left = self.node_count
        else:
            self._insert(self.nodes[idx].left, v)
    else:
        if self.nodes[idx].right == 0:
            self.node_count += 1
            self.nodes[self.node_count] = Node({val: v, left: 0, right: 0})
            self.nodes[idx].right = self.node_count
        else:
            self._insert(self.nodes[idx].right, v)

@external
def treesort(arr: int128[7]) -> int128[7]:
    self.node_count = 1
    self.nodes[1] = Node({val: arr[0], left: 0, right: 0})
    self.root = 1
    for i: uint256 in range(1, 7):
        self._insert(self.root, arr[i])
    result: int128[7] = empty(int128[7])
    return result
