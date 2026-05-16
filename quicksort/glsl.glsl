#version 450

layout(local_size_x = 1) in;
layout(std430, binding = 0) buffer Data {
    int arr[];
};
layout(std430, binding = 1) buffer Params {
    int n;
};

shared int stack_low[64];
shared int stack_high[64];

void quicksort_iterative(int low, int high) {
    int sp = 0;
    stack_low[sp] = low;
    stack_high[sp] = high;
    while (sp >= 0) {
        int l = stack_low[sp];
        int h = stack_high[sp];
        sp--;
        if (l < h) {
            int pivot = arr[h];
            int i = l;
            for (int j = l; j < h; j++) {
                if (arr[j] <= pivot) {
                    int tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
                    i++;
                }
            }
            int tmp = arr[i]; arr[i] = arr[h]; arr[h] = tmp;
            sp++;
            stack_low[sp] = l;
            stack_high[sp] = i - 1;
            sp++;
            stack_low[sp] = i + 1;
            stack_high[sp] = h;
        }
    }
}

void main() {
    if (gl_GlobalInvocationID.x == 0u) {
        quicksort_iterative(0, n - 1);
    }
}
