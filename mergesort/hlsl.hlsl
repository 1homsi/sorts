RWStructuredBuffer<int> arr : register(u0);
RWStructuredBuffer<int> tmp : register(u1);

cbuffer Constants : register(b0) {
    int n;
};

void merge_step(int lo, int mid, int hi) {
    int i = lo, j = mid + 1, k = lo;
    while (i <= mid && j <= hi) {
        if (arr[i] <= arr[j]) tmp[k++] = arr[i++];
        else tmp[k++] = arr[j++];
    }
    while (i <= mid) tmp[k++] = arr[i++];
    while (j <= hi) tmp[k++] = arr[j++];
    for (int x = lo; x <= hi; x++) arr[x] = tmp[x];
}

void merge_sort(int lo, int hi) {
    if (lo >= hi) return;
    int mid = (lo + hi) / 2;
    merge_sort(lo, mid);
    merge_sort(mid + 1, hi);
    merge_step(lo, mid, hi);
}

[numthreads(1, 1, 1)]
void CSMain(uint3 id : SV_DispatchThreadID) {
    merge_sort(0, n - 1);
}
