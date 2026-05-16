__kernel void treesort(__global int* arr, __global int* result, int n) {
    int nodeVal[64];
    int nodeLeft[64];
    int nodeRight[64];
    int nodeCount = 0;
    int root = 0;

    for (int i = 0; i < n; i++) {
        nodeCount++;
        int nidx = nodeCount;
        nodeVal[nidx] = arr[i];
        nodeLeft[nidx] = 0;
        nodeRight[nidx] = 0;
        if (i == 0) { root = nidx; continue; }
        int cur = root;
        while (1) {
            if (arr[i] < nodeVal[cur]) {
                if (nodeLeft[cur] == 0) { nodeLeft[cur] = nidx; break; }
                cur = nodeLeft[cur];
            } else {
                if (nodeRight[cur] == 0) { nodeRight[cur] = nidx; break; }
                cur = nodeRight[cur];
            }
        }
    }

    int stk[64], stkTop = 0, resIdx = 0;
    int cur = root;
    while (cur != 0 || stkTop > 0) {
        while (cur != 0) { stk[stkTop++] = cur; cur = nodeLeft[cur]; }
        cur = stk[--stkTop];
        result[resIdx++] = nodeVal[cur];
        cur = nodeRight[cur];
    }
}
