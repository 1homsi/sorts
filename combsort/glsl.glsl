#version 430

layout(local_size_x = 1) in;
layout(std430, binding = 0) buffer DataBuffer {
    int arr[];
};
uniform int n;

void combSort() {
    int gap = n;
    bool sorted = false;
    while (!sorted) {
        gap = int(float(gap) / 1.3);
        if (gap <= 1) {
            gap = 1;
            sorted = true;
        }
        for (int i = 0; i + gap < n; i++) {
            if (arr[i] > arr[i + gap]) {
                int tmp = arr[i];
                arr[i] = arr[i + gap];
                arr[i + gap] = tmp;
                sorted = false;
            }
        }
    }
}

void main() {
    combSort();
}
