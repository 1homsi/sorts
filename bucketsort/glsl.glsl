#version 450

layout(local_size_x = 1) in;

layout(std430, binding = 0) buffer InputBuffer {
    float arr[];
};

layout(std430, binding = 1) buffer OutputBuffer {
    float result[];
};

layout(std430, binding = 2) buffer ParamBuffer {
    int n;
    float minV;
    float maxV;
};

shared float buckets[10][10];
shared int counts[10];

void insertionSort(int b, int m) {
    for (int i = 1; i < m; i++) {
        float key = buckets[b][i];
        int j = i - 1;
        while (j >= 0 && buckets[b][j] > key) {
            buckets[b][j + 1] = buckets[b][j];
            j--;
        }
        buckets[b][j + 1] = key;
    }
}

void main() {
    for (int i = 0; i < n; i++) counts[i] = 0;
    for (int i = 0; i < n; i++) {
        int idx = int((arr[i] - minV) / (maxV - minV + 1.0) * float(n));
        if (idx >= n) idx = n - 1;
        buckets[idx][counts[idx]++] = arr[i];
    }
    int pos = 0;
    for (int b = 0; b < n; b++) {
        insertionSort(b, counts[b]);
        for (int i = 0; i < counts[b]; i++) {
            result[pos++] = buckets[b][i];
        }
    }
}
