__kernel void count_occurrences(
    __global const int* arr,
    __global int* count,
    const int n,
    const int min_val)
{
    int gid = get_global_id(0);
    if (gid < n) {
        atomic_add(&count[arr[gid] - min_val], 1);
    }
}

__kernel void prefix_sum(
    __global int* count,
    const int range)
{
    int gid = get_global_id(0);
    if (gid == 0) {
        for (int i = 1; i < range; i++) {
            count[i] += count[i - 1];
        }
    }
}

__kernel void scatter(
    __global const int* arr,
    __global int* output,
    __global int* count,
    const int n,
    const int min_val)
{
    if (get_global_id(0) == 0) {
        for (int i = n - 1; i >= 0; i--) {
            count[arr[i] - min_val]--;
            output[count[arr[i] - min_val]] = arr[i];
        }
    }
}
