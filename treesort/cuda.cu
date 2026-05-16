#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int val;
    struct Node *left, *right;
} Node;

Node* insert(Node* node, int val) {
    if (!node) {
        Node* n = (Node*)malloc(sizeof(Node));
        n->val = val; n->left = n->right = NULL;
        return n;
    }
    if (val < node->val) node->left = insert(node->left, val);
    else node->right = insert(node->right, val);
    return node;
}

void inorder(Node* node, int* result, int* idx) {
    if (!node) return;
    inorder(node->left, result, idx);
    result[(*idx)++] = node->val;
    inorder(node->right, result, idx);
}

int main() {
    int arr[] = {5, 3, 7, 1, 4, 6, 8};
    int n = 7, result[7];
    Node* root = NULL;
    for (int i = 0; i < n; i++) root = insert(root, arr[i]);
    int idx = 0;
    inorder(root, result, &idx);
    for (int i = 0; i < n; i++) printf("%d ", result[i]);
    printf("\n");
    return 0;
}
