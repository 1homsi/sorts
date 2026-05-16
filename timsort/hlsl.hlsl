RWStructuredBuffer<int> arr : register(u0);
cbuffer Constants : register(b0) {
    int n;
    int minRun;
};

void insertionSort(int left, int right) {
    for (int i = left + 1; i <= right; i++) {
        int key = arr[i];
        int j = i - 1;
        while (j >= left && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

void mergeRuns(int left, int mid, int right) {
    int lp[256], rp[256];
    int ln = mid - left + 1;
    int rn = right - mid;
    for (int i = 0; i < ln; i++) lp[i] = arr[left + i];
    for (int i = 0; i < rn; i++) rp[i] = arr[mid + 1 + i];
    int i = 0, j = 0, k = left;
    while (i < ln && j < rn) {
        if (lp[i] <= rp[j]) arr[k++] = lp[i++];
        else arr[k++] = rp[j++];
    }
    while (i < ln) arr[k++] = lp[i++];
    while (j < rn) arr[k++] = rp[j++];
}

[numthreads(1, 1, 1)]
void CSMain(uint3 id : SV_DispatchThreadID) {
    int i = 0;
    while (i < n) {
        int right = min(i + minRun - 1, n - 1);
        insertionSort(i, right);
        i += minRun;
    }
    int size = minRun;
    while (size < n) {
        int left = 0;
        while (left < n) {
            int mid = min(left + size - 1, n - 1);
            int right = min(left + 2 * size - 1, n - 1);
            if (mid < right) mergeRuns(left, mid, right);
            left += 2 * size;
        }
        size *= 2;
    }
}
