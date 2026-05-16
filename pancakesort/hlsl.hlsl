RWStructuredBuffer<int> arr : register(u0);

void flip(int k) {
    int left = 0, right = k, tmp;
    while (left < right) {
        tmp = arr[left];
        arr[left] = arr[right];
        arr[right] = tmp;
        left++;
        right--;
    }
}

int findMaxIdx(int size) {
    int maxIdx = 0;
    for (int i = 1; i < size; i++) {
        if (arr[i] > arr[maxIdx]) maxIdx = i;
    }
    return maxIdx;
}

[numthreads(1, 1, 1)]
void CSMain(uint3 id : SV_DispatchThreadID) {
    int n = 7;
    for (int size = n; size > 1; size--) {
        int maxIdx = findMaxIdx(size);
        if (maxIdx != size - 1) {
            if (maxIdx != 0) flip(maxIdx);
            flip(size - 1);
        }
    }
}
