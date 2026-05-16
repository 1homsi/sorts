#version 450

layout(local_size_x = 1) in;
layout(std430, binding = 0) buffer ArrayBuf { int arr[]; };
layout(std430, binding = 1) buffer OutputBuf { int output_arr[]; };
layout(std430, binding = 2) buffer CountBuf { int count[]; };
uniform int n;
uniform int exp;

void countingSort() {
    for (int i = 0; i < 10; i++) count[i] = 0;
    for (int i = 0; i < n; i++) count[(arr[i] / exp) % 10]++;
    for (int i = 1; i < 10; i++) count[i] += count[i - 1];
    for (int i = n - 1; i >= 0; i--) {
        int idx = (arr[i] / exp) % 10;
        count[idx]--;
        output_arr[count[idx]] = arr[i];
    }
    for (int i = 0; i < n; i++) arr[i] = output_arr[i];
}

void main() {
    countingSort();
}
