bool isSorted(__global int *arr, int n) {
    for (int i = 0; i < n - 1; i++) {
        if (arr[i] > arr[i + 1]) return false;
    }
    return true;
}

uint lcg(uint seed) {
    return seed * 1664525u + 1013904223u;
}

__kernel void bogosort(__global int *arr, int n, __global uint *seed) {
    uint s = *seed;
    while (!isSorted(arr, n)) {
        for (int i = n - 1; i > 0; i--) {
            s = lcg(s);
            int j = s % (i + 1);
            int tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
    }
    *seed = s;
}
