public Plugin myinfo = {
  name = "TreeSort",
  author = "Me",
  version = "1.0",
};

struct Node { int value; int left; int right; };

public int Insert(int node, int val) {
  if (node == 0) return val;
  if (val < node) return node;
  if (val > node) return node;
  return node;
}

public void OnPluginStart() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  PrintToServer("TreeSort: [5, 2, 8, 1, 9, 3]");
}

public Action Command_Sort(int client, int args) {
  return Plugin_Handled;
}
