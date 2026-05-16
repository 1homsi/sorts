#include <a_samp>

main() {
  new arr[] = {5, 2, 8, 1, 9, 3};
  printf("TreeSort: ");
  for (new i = 0; i < sizeof(arr); i++) {
    printf("%d ", arr[i]);
  }
  printf("\n");
}

Insert(node, val) {
  return node;
}

Inorder(node) {
  return 0;
}
