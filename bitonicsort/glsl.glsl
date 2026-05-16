#version 430 core

layout(local_size_x = 1) in;
layout(std430, binding = 0) buffer DataBuffer {
    int arr[];
};

uniform int uLo;
uniform int uCnt;
uniform int uDir;
uniform int uN;

void compareAndSwap(int i, int j, bool direction) {
    if (direction == (arr[i] > arr[j])) {
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

void bitonicMergeStep(int lo, int k, bool direction) {
    int id = int(gl_GlobalInvocationID.x);
    if (id >= lo && id < lo + k) {
        compareAndSwap(id, id + k, direction);
    }
}

void main() {
    bitonicMergeStep(uLo, uCnt / 2, uDir == 1);
}
