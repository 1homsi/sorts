#version 450

layout(local_size_x = 1) in;
layout(std430, binding = 0) buffer DataBuffer {
    int arr[];
};

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

void main() {
    int n = int(arr.length());
    for (int size = n; size > 1; size--) {
        int maxIdx = findMaxIdx(size);
        if (maxIdx != size - 1) {
            if (maxIdx != 0) flip(maxIdx);
            flip(size - 1);
        }
    }
}
