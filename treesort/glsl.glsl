#version 450

layout(local_size_x = 1) in;
layout(std430, binding = 0) buffer InputBuf { int arr[]; };
layout(std430, binding = 1) buffer OutputBuf { int result[]; };

int nodeVal[64];
int nodeLeft[64];
int nodeRight[64];
int nodeCount = 0;
int root = 0;

int newNode(int v) {
    nodeCount++;
    nodeVal[nodeCount] = v;
    nodeLeft[nodeCount] = 0;
    nodeRight[nodeCount] = 0;
    return nodeCount;
}

void insert(int idx, int v) {
    while (true) {
        if (v < nodeVal[idx]) {
            if (nodeLeft[idx] == 0) { nodeLeft[idx] = newNode(v); return; }
            idx = nodeLeft[idx];
        } else {
            if (nodeRight[idx] == 0) { nodeRight[idx] = newNode(v); return; }
            idx = nodeRight[idx];
        }
    }
}

int stack[64];
int stackTop = 0;
int resIdx = 0;

void inorder() {
    int cur = root;
    while (cur != 0 || stackTop > 0) {
        while (cur != 0) { stack[stackTop++] = cur; cur = nodeLeft[cur]; }
        cur = stack[--stackTop];
        result[resIdx++] = nodeVal[cur];
        cur = nodeRight[cur];
    }
}

void main() {
    int n = int(gl_NumWorkGroups.x);
    root = newNode(arr[0]);
    for (int i = 1; i < n; i++) insert(root, arr[i]);
    inorder();
}
