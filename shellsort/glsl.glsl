#version 450

layout(local_size_x = 1) in;
layout(std430, binding = 0) buffer DataBuffer {
    int arr[];
};

uniform int n;

void shellSort() {
    int gap = n / 2;
    while (gap > 0) {
        for (int i = gap; i < n; i++) {
            int temp = arr[i];
            int j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap /= 2;
    }
}

void main() {
    shellSort();
}
