#include <iostream>
#include <vector>

struct Node {
    int val;
    Node *left, *right;
    Node(int v) : val(v), left(nullptr), right(nullptr) {}
};

Node* insert(Node* node, int val) {
    if (!node) return new Node(val);
    if (val < node->val) node->left = insert(node->left, val);
    else node->right = insert(node->right, val);
    return node;
}

void inorder(Node* node, std::vector<int>& result) {
    if (!node) return;
    inorder(node->left, result);
    result.push_back(node->val);
    inorder(node->right, result);
}

std::vector<int> treesort(std::vector<int> arr) {
    Node* root = nullptr;
    for (int val : arr) root = insert(root, val);
    std::vector<int> result;
    inorder(root, result);
    return result;
}

int main() {
    auto sorted = treesort({5, 3, 7, 1, 4, 6, 8});
    for (int v : sorted) std::cout << v << " ";
    std::cout << std::endl;
    return 0;
}
