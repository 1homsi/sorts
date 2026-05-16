#include <metal_stdlib>
using namespace metal;

kernel void insertion_sort(
    device int* arr [[buffer(0)]],
    device int* sorted [[buffer(1)]],
    constant int& n [[buffer(2)]],
    uint gid [[thread_position_in_grid]])
{
    for (int i = 0; i < n; i++) sorted[i] = arr[i];
    for (int i = 1; i < n; i++) {
        int key = sorted[i];
        int j = i - 1;
        while (j >= 0 && sorted[j] > key) {
            sorted[j + 1] = sorted[j];
            j--;
        }
        sorted[j + 1] = key;
    }
}
