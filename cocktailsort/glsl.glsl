#version 450

layout(local_size_x = 1) in;
layout(std430, binding = 0) buffer DataBuffer {
    int arr[];
};
uniform int n;

void cocktailSort() {
    bool swapped = true;
    int start = 0;
    int end = n - 1;
    int tmp;
    while (swapped) {
        swapped = false;
        for (int i = start; i < end; i++) {
            if (arr[i] > arr[i + 1]) {
                tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        if (!swapped) break;
        swapped = false;
        end--;
        for (int i = end - 1; i >= start; i--) {
            if (arr[i] > arr[i + 1]) {
                tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        start++;
    }
}

void main() {
    cocktailSort();
}
