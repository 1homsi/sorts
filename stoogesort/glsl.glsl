#version 450

layout(local_size_x = 1) in;

layout(std430, binding = 0) buffer Data {
    int arr[];
};

layout(push_constant) uniform Params {
    int n;
};

void stoogeSort(int first, int last) {
    if (arr[first] > arr[last]) {
        int tmp = arr[first];
        arr[first] = arr[last];
        arr[last] = tmp;
    }
    int len = last - first + 1;
    if (len > 2) {
        int t = len * 2 / 3;
        stoogeSort(first, first + t - 1);
        stoogeSort(last - t + 1, last);
        stoogeSort(first, first + t - 1);
    }
}

void main() {
    if (gl_GlobalInvocationID.x == 0u) {
        stoogeSort(0, n - 1);
    }
}
