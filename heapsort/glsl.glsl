#version 430 core

layout(local_size_x = 1) in;
layout(std430, binding = 0) buffer SortBuffer {
    int arr[];
};
uniform int n;
uniform int phase;

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

void main() {
    if (phase == 0) {
        int i = int(n / 2) - 1 - int(gl_GlobalInvocationID.x);
        if (i >= 0) heapify(n, i);
    } else {
        int i = n - 1 - int(gl_GlobalInvocationID.x);
        if (i > 0) {
            int tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp;
            heapify(i, 0);
        }
    }
}
