#include <stdio.h>

struct Node {
  int value;
  struct Node *left;
  struct Node *right;
};

struct Node* insert(struct Node *node, int val) {
  if (node == NULL) {
    node = malloc(sizeof(struct Node));
    node->value = val;
    node->left = NULL;
    node->right = NULL;
    return node;
  }
  if (val < node->value) {
    node->left = insert(node->left, val);
  } else if (val > node->value) {
    node->right = insert(node->right, val);
  }
  return node;
}

void inorder(struct Node *node) {
  if (node != NULL) {
    inorder(node->left);
    printf("%d ", node->value);
    inorder(node->right);
  }
}

void main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  struct Node *root = NULL;
  for (int i = 0; i < 6; i++) {
    root = insert(root, arr[i]);
  }
  inorder(root);
}
