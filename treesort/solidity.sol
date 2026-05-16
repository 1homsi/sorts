// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreeSort {
    struct Node {
        int256 val;
        uint256 left;
        uint256 right;
    }

    Node[] nodes;
    uint256 root;
    bool hasRoot;

    function insert(uint256 idx, int256 v) internal returns (uint256) {
        if (idx == 0 && !hasRoot) {
            nodes.push(Node(v, 0, 0));
            hasRoot = true;
            return nodes.length - 1;
        }
        if (v < nodes[idx].val) {
            if (nodes[idx].left == 0) {
                nodes.push(Node(v, 0, 0));
                nodes[idx].left = nodes.length - 1;
            } else {
                insert(nodes[idx].left, v);
            }
        } else {
            if (nodes[idx].right == 0) {
                nodes.push(Node(v, 0, 0));
                nodes[idx].right = nodes.length - 1;
            } else {
                insert(nodes[idx].right, v);
            }
        }
        return idx;
    }

    function inorder(uint256 idx, int256[] memory result, uint256 pos) internal view returns (uint256) {
        if (idx >= nodes.length) return pos;
        if (nodes[idx].left != 0) pos = inorder(nodes[idx].left, result, pos);
        result[pos++] = nodes[idx].val;
        if (nodes[idx].right != 0) pos = inorder(nodes[idx].right, result, pos);
        return pos;
    }

    function treesort(int256[] memory arr) public returns (int256[] memory) {
        for (uint i = 0; i < arr.length; i++) {
            if (!hasRoot) {
                nodes.push(Node(arr[i], 0, 0));
                hasRoot = true;
                root = 0;
            } else {
                insert(root, arr[i]);
            }
        }
        int256[] memory result = new int256[](arr.length);
        inorder(root, result, 0);
        return result;
    }
}
