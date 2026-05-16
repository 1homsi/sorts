#version 430 core

layout(local_size_x = 256) in;
layout(std430, binding = 0) buffer Data {
    int arr[];
    int result[];
    int count[];
    int n;
    int minVal;
    int maxVal;
};

void main() {
    uint id = gl_GlobalInvocationID.x;
    if (id == 0u) {
        int range = maxVal - minVal + 1;
        for (int i = 0; i < range; i++) count[i] = 0;
        for (int i = 0; i < n; i++) count[arr[i] - minVal]++;
        for (int i = 1; i < range; i++) count[i] += count[i - 1];
        for (int i = n - 1; i >= 0; i--) {
            count[arr[i] - minVal]--;
            result[count[arr[i] - minVal]] = arr[i];
        }
    }
}
