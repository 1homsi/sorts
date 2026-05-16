RWStructuredBuffer<int> arr : register(u0);
cbuffer Constants : register(b0) {
    int n;
    int phase;
};

void heapify(int sz, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;
    if (left < sz && arr[left] > arr[largest]) largest = left;
    if (right < sz && arr[right] > arr[largest]) largest = right;
    if (largest != i) {
        int tmp = arr[i];
        arr[i] = arr[largest];
        arr[largest] = tmp;
    }
}

[numthreads(1, 1, 1)]
void CSMain(uint3 id : SV_DispatchThreadID) {
    if (phase == 0) {
        int i = n / 2 - 1 - (int)id.x;
        if (i >= 0) heapify(n, i);
    } else {
        int i = n - 1 - (int)id.x;
        if (i > 0) {
            int tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp;
            heapify(i, 0);
        }
    }
}
