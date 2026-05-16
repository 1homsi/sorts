RWStructuredBuffer<int> arr : register(u0);
RWStructuredBuffer<int> result : register(u1);

static int nodeVal[64];
static int nodeLeft[64];
static int nodeRight[64];
static int nodeCount = 0;
static int root = 0;

int newNode(int v) {
    nodeCount++;
    nodeVal[nodeCount] = v;
    nodeLeft[nodeCount] = 0;
    nodeRight[nodeCount] = 0;
    return nodeCount;
}

void insertNode(int idx, int v) {
    [allow_uav_condition] while (true) {
        if (v < nodeVal[idx]) {
            if (nodeLeft[idx] == 0) { nodeLeft[idx] = newNode(v); return; }
            idx = nodeLeft[idx];
        } else {
            if (nodeRight[idx] == 0) { nodeRight[idx] = newNode(v); return; }
            idx = nodeRight[idx];
        }
    }
}

static int stk[64];
static int stkTop = 0;
static int resIdx = 0;

void inorder() {
    int cur = root;
    [allow_uav_condition] while (cur != 0 || stkTop > 0) {
        [allow_uav_condition] while (cur != 0) { stk[stkTop++] = cur; cur = nodeLeft[cur]; }
        cur = stk[--stkTop];
        result[resIdx++] = nodeVal[cur];
        cur = nodeRight[cur];
    }
}

[numthreads(1,1,1)]
void CSMain(uint3 id : SV_DispatchThreadID) {
    int n = 7;
    root = newNode(arr[0]);
    for (int i = 1; i < n; i++) insertNode(root, arr[i]);
    inorder();
}
