RWStructuredBuffer<int> arr : register(u0);

cbuffer Params : register(b0) {
    int lo;
    int cnt;
    int dir;
    int n;
};

void compareAndSwap(int i, int j, bool direction) {
    if (direction == (arr[i] > arr[j])) {
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

[numthreads(64, 1, 1)]
void BitonicMergeStep(uint3 id : SV_DispatchThreadID) {
    int k = cnt / 2;
    int i = lo + (int)id.x;
    if (i < lo + k) {
        compareAndSwap(i, i + k, dir == 1);
    }
}
